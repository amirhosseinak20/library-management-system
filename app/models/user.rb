class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable
  # associations
  has_many :rates
  has_many :books, through: :rates
  has_one :role

  # validations
  validates :first_name, :last_name, :nickname, length: { maximum: 50 }
  validates :first_name, :last_name, :email, :phone, :password, presence: true
  validates :email, format: { with: /\A([a-zA-Z0-9_\-\.]+)@([a-zA-Z0-9_\-]+)\.([a-zA-Z]{2,5})\z/, message: 'please provide valid email!' }
  validates :first_name, :last_name, format: { with: /\A[a-zA-Z]+\z/, message: 'Please provide valid name' }
  validates_date :birth_date, before: -> { Date.today }, before_message: 'must be before today'
  validates :phone, format: { with: /\A\+\d{12}\z/ }, length: { is: 13 }
end
