class Book < ApplicationRecord
  # associations
  has_many :borrows
  has_many :borrowers, through: :borrows, class_name: "User", source: "user"
  belongs_to :publisher, optional: true
  has_and_belongs_to_many :authors, class_name: "User", join_table: "authors_books"
  has_one_attached :front_cover
  has_one_attached :back_cover
  has_one_attached :sample

  # validations
  validates :isbn, format: { with: /\A\d+\z/, message: 'Please provide a valid isbn' }, length: { minimum: 10, maximum: 14 }
  validates :front_cover, :back_cover, blob: { content_type: :image }
  validates :sample, blob: { content_type: 'application/pdf' }

  def self.search(query, order, limit)
    Book.where('title like ?', query).order(order).limit(limit)
  end
end
