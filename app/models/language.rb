class Language < ApplicationRecord
  # associations
  has_many :books_languages
  has_many :books, through: :books_languages

  # validations
  validates :code, format: { with: /A\w\w-\w\w\z/ }, length: { maximum: 5 }
end
