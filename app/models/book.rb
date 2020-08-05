class Book < ApplicationRecord
  # associations
  belongs_to :publisher, optional: true
  has_and_belongs_to_many :authors, class_name: "User"
  has_many :borrows
  has_many :users, through: :borrows

  # validations
  validates :isbn, format: { with: /\A\d+\z/, message: 'Please provide a valid isbn' }, length: { minimum: 10, maximum: 14 }

  def self.search(query, order, limit)
    Book.where('title like ?', query).order(order).limit(limit)
  end
end
