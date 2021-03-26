require 'rails_helper'

RSpec.describe "areas/show", type: :view do
  before(:each) do
    @area = assign(:area, Area.create!(
      institution: nil,
      name: "Name"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(/Name/)
  end
end
