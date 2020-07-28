class User < ApplicationRecord
  validates :first_name, :last_name, :nickname, length: { maximum: 50 }
  validates :first_name, :last_name, :email, :phone, :password, presence: true
  validates :email, format: { with: /\A([a-zA-Z0-9_\-\.]+)@([a-zA-Z0-9_\-]+)\.([a-zA-Z]{2,5})\z/, message: 'please provide valid email!' }
  validates :first_name, :last_name, format: { with: /\A[a-zA-Z]+\z/, message: 'Please provide valid name' }
  validates_date :birth_date, before: -> { Date.today }, before_message: 'must be before today'
  validates :phone, format: { with: /\A\+\d{12}\z/ }, length: { is: 13 }
  validates :password, format: { with: /\A([\w\W])+\z/ }, length: { minimum: 8 }
end
