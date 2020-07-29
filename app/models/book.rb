class Book < ApplicationRecord
  # associations
  include Rateable


  # validations
  validates :isbn, format: { with: /\A\d+\z/, message: 'Please provide a valid isbn' }, length: { minimum: 10, maximum: 13 }
end
