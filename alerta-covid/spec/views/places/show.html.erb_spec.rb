require 'rails_helper'

RSpec.describe "places/show", type: :view do
  before(:each) do
    @place = assign(:place, Place.create!(
      name: "Name",
      qr_code: "Qr Code",
      area: nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Qr Code/)
    expect(rendered).to match(//)
  end
end
