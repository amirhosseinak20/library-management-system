require 'rails_helper'

RSpec.describe "semafors/edit", type: :view do
  before(:each) do
    @semafor = assign(:semafor, Semafor.create!())
  end

  it "renders the edit semafor form" do
    render

    assert_select "form[action=?][method=?]", semafor_path(@semafor), "post" do
    end
  end
end
