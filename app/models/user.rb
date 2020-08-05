class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         # ,:confirmable

  # associations
  belongs_to :role
  delegate :permissions, to: :role, allow_nil: true
  has_and_belongs_to_many :books
  has_many :borrows
  has_many :books, through: :borrows

  # validations
  validates :first_name, :last_name, :nickname, length: {maximum: 50}
  validates :first_name, :last_name, :email, :phone, :password, presence: true
  validates :email, format: {with: /\A([a-zA-Z0-9_\-\.]+)@([a-zA-Z0-9_\-]+)\.([a-zA-Z]{2,5})\z/, message: 'please provide valid email!'}
  validates :first_name, :last_name, format: {with: /\A[a-zA-Z]+\z/, message: 'Please provide valid name'}
  validates_date :birth_date, before: -> { Date.today }, before_message: 'must be before today'
  validates :phone, format: {with: /\A\+\d{12}\z/}, length: {is: 13}

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
