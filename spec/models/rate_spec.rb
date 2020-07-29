require 'rails_helper'

RSpec.describe Rate, type: :model do
  it { is_expected.to have_db_column(:rateable_id).of_type(:integer) }
  it { is_expected.to have_db_column(:rateable_type).of_type(:string) }

  it { is_expected.to belong_to(:rateable) }
end
