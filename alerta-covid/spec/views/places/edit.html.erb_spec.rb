require 'rails_helper'

RSpec.describe "places/edit", type: :view do
  before(:each) do
    @place = assign(:place, Place.create!(
      name: "MyString",
      qr_code: "MyString",
      area: nil
    ))
  end

  it "renders the edit place form" do
    render

    assert_select "form[action=?][method=?]", place_path(@place), "post" do

      assert_select "input[name=?]", "place[name]"

      assert_select "input[name=?]", "place[qr_code]"

      assert_select "input[name=?]", "place[area_id]"
    end
  end
end
