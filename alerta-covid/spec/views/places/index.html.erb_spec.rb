require 'rails_helper'

RSpec.describe "places/index", type: :view do
  before(:each) do
    assign(:places, [
      Place.create!(
        name: "Name",
        qr_code: "Qr Code",
        area: nil
      ),
      Place.create!(
        name: "Name",
        qr_code: "Qr Code",
        area: nil
      )
    ])
  end

  it "renders a list of places" do
    render
    assert_select "tr>td", text: "Name".to_s, count: 2
    assert_select "tr>td", text: "Qr Code".to_s, count: 2
    assert_select "tr>td", text: nil.to_s, count: 2
  end
end
