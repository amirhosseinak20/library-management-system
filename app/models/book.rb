class Book < ApplicationRecord
  # associations
  belongs_to :publisher, optional: true
  has_and_belongs_to_many :authors, class_name: "User"

  # validations
  validates :isbn, format: { with: /\A\d+\z/, message: 'Please provide a valid isbn' }, length: { minimum: 10, maximum: 14 }

end
