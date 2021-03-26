require 'rails_helper'

RSpec.describe "areas/edit", type: :view do
  before(:each) do
    @area = assign(:area, Area.create!(
      institution: nil,
      name: "MyString"
    ))
  end

  it "renders the edit area form" do
    render

    assert_select "form[action=?][method=?]", area_path(@area), "post" do

      assert_select "input[name=?]", "area[institution_id]"

      assert_select "input[name=?]", "area[name]"
    end
  end
end
