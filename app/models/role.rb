class Role < ApplicationRecord
  # associations
  has_many :users
  has_many :roles_privileges
  has_many :privileges, through: :roles_privileges

end
