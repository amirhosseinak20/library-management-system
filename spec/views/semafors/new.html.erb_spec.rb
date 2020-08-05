require 'rails_helper'

RSpec.describe "semafors/new", type: :view do
  before(:each) do
    assign(:semafor, Semafor.new())
  end

  it "renders new semafor form" do
    render

    assert_select "form[action=?][method=?]", semafors_path, "post" do
    end
  end
end
