require 'rails_helper'
require "models/concerns/rateable_spec"

RSpec.describe Book, type: :model do
  it_behaves_like "rateable"
end
