require 'rails_helper'

RSpec.describe "semafors/show", type: :view do
  before(:each) do
    @semafor = assign(:semafor, Semafor.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
