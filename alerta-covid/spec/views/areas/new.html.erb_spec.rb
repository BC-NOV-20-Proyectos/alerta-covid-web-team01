require 'rails_helper'

RSpec.describe "areas/new", type: :view do
  before(:each) do
    assign(:area, Area.new(
      institution: nil,
      name: "MyString"
    ))
  end

  it "renders new area form" do
    render

    assert_select "form[action=?][method=?]", areas_path, "post" do

      assert_select "input[name=?]", "area[institution_id]"

      assert_select "input[name=?]", "area[name]"
    end
  end
end
