class MaximumValidator < ActiveModel::Validator
  def validate(record)
    unless current_user.can_borrow_book?
      record.errors[:max_borrow] << "You reach maximum amounts"
    end
  end
end

class Borrow < ApplicationRecord
  # constants
  PENALTY = 1
  # associations
  belongs_to :user
  belongs_to :book

  validates_with MaximumValidator, on: [:save]
end
