class Rate < ApplicationRecord
  # associations
  belongs_to :book
  belongs_to :language

end
