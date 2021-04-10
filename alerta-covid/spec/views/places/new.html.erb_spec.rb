require 'rails_helper'

RSpec.describe "places/new", type: :view do
  before(:each) do
    assign(:place, Place.new(
      name: "MyString",
      qr_code: "MyString",
      area: nil
    ))
  end

  it "renders new place form" do
    render

    assert_select "form[action=?][method=?]", places_path, "post" do

      assert_select "input[name=?]", "place[name]"

      assert_select "input[name=?]", "place[qr_code]"

      assert_select "input[name=?]", "place[area_id]"
    end
  end
end
