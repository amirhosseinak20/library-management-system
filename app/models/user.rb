class User < ApplicationRecord
  # constants
  MAX_BORROW_ITEM = 4

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  # ,:confirmable

  # associations
  has_many :borrows
  has_many :borrowed_books, through: :borrows, class_name: "Book", source: "book"
  has_and_belongs_to_many :books, join_table: "authors_books", class_name: "Book"
  belongs_to :role
  delegate :permissions, to: :role, allow_nil: true
  has_one_attached :avatar

  # validations
  validates :first_name, :last_name, :nickname, length: { maximum: 50 }
  validates :first_name, :last_name, :email, :phone, :password, presence: true
  validates :email, format: { with: /\A([a-zA-Z0-9_\-\.]+)@([a-zA-Z0-9_\-]+)\.([a-zA-Z]{2,5})\z/, message: 'please provide valid email!' }
  validates :first_name, :last_name, format: { with: /\A[a-zA-Z]+\z/, message: 'Please provide valid name' }
  validates_date :birth_date, before: -> { Date.today }, before_message: 'must be before today'
  validates :phone, format: { with: /\A\+\d{12}\z/ }, length: { is: 13 }
  validates :avatar, blob: { content_type: :image }

  def initialize(args)
    #
    # do whatever, args are passed to super
    #
    args[:role_id] = Role.where(name: 'student').first.id if args && args['role_id'].nil?
    super
  end

  def method_missing(method_id, *args)
    if (match = matches_dynamic_role_check?(method_id))
      tokenize_roles(match.captures.first).each do |check|
        return role.name.downcase == check
      end
      false
    elsif (match = matches_dynamic_perm_check?(method_id))
      return true if !permissions.nil? && permissions.find_by_name(match.captures.first)
    else
      super
    end
  end

  def respond_to_missing?(method_name, include_private = false)
    matches_dynamic_role_check?(method_name) || super
  end

  def signed_in?
    !role.nil?
  end

  def author?(book_id)
    if is_an_author?
      !books.where({ books: { id: book_id } }).empty?
    elsif can_edit_book?
      true
    else
      false
    end
  end

  def name
    "#{first_name} #{last_name}"
  end

  def can_borrow_book?(book_id)
    borrows.where(return_date: nil).count < MAX_BORROW_ITEM && permissions.find_by_name('borrow_books')
  end

  def can_update_book?(book_id)
    permissions.find_by_name('update_books') || books.where(id: book_id)[0]
  end

  def can_update_user?(user_id)
    permissions.find_by_name('update_users') || user_id == id
  end

  private

  def matches_dynamic_role_check?(method_id)
    /^is_an?_([a-zA-Z]\w*)\?$/.match(method_id.to_s)
  end

  def tokenize_roles(string_to_split)
    string_to_split.split(/_or_/)
  end

  def matches_dynamic_perm_check?(method_id)
    /^can_([a-zA-Z]\w*)\?$/.match(method_id.to_s)
  end
end
