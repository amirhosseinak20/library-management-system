class Language < ApplicationRecord
  validates :code, format: { with: /A\w\w-\w\w\z/ }, length: { maximum: 5 }
end
