class Book < ApplicationRecord
  # associations
  include Rateable
  has_many :rates
  has_many :users, through: :rates
  has_one :publisher

  # validations
  validates :isbn, format: { with: /\A\d+\z/, message: 'Please provide a valid isbn' }, length: { minimum: 10, maximum: 13 }
  validates :attrs, :validate_attrs

  private

  def validate_attrs
    true
  end
end
