module Rateable
  extend ActiveSupport::Concern

  included do
    has_many :rates, as: :rateable
  end
end