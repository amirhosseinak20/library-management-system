class Privilege < ApplicationRecord
  # associations
  has_many :roles_privileges
  has_many :roles, through: :roles_privileges

end
