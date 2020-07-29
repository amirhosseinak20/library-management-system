shared_examples "rateable" do
  it { is_expected.to have_many(:rates) }
end