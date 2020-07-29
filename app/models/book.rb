class Book < ApplicationRecord
  # associations
  include Rateable
  has_many :rates
  has_many :users, through: :rates
  has_many :books_languages
  has_many :languages, through: :books_languages
  has_many :books_genres
  has_many :genres, through: :books_genres
  has_one :publisher

  # validations
  validates :isbn, format: { with: /\A\d+\z/, message: 'Please provide a valid isbn' }, length: { minimum: 10, maximum: 13 }
end
