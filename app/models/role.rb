class Role < ApplicationRecord
  # associations
  has_and_belongs_to_many :permissions
  has_many :users

end
