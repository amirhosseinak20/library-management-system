require 'rails_helper'

RSpec.describe "semafors/index", type: :view do
  before(:each) do
    assign(:semafors, [
      Semafor.create!(),
      Semafor.create!()
    ])
  end

  it "renders a list of semafors" do
    render
  end
end
