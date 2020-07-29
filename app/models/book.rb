class Book < ApplicationRecord
  # associations
  include Rateable
  belongs_to :user, foreign_key: :author_id
  has_many :books_languages
  has_many :languages, through: :books_languages
  has_one :language
  has_one :genre
  has_one :publisher

  # validations
  validates :isbn, format: { with: /\A\d+\z/, message: 'Please provide a valid isbn' }, length: { minimum: 10, maximum: 13 }
end
