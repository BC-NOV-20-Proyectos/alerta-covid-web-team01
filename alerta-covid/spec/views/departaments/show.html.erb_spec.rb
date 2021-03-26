require 'rails_helper'

RSpec.describe "departaments/show", type: :view do
  before(:each) do
    @departament = assign(:departament, Departament.create!(
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
