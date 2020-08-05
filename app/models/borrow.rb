class Borrow < ApplicationRecord
  # associations
  belongs_to :user
  belongs_to :book

end
