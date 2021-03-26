require 'rails_helper'

RSpec.describe "departaments/index", type: :view do
  before(:each) do
    assign(:departaments, [
      Departament.create!(
        institution: nil,
        name: "Name"
      ),
      Departament.create!(
        institution: nil,
        name: "Name"
      )
    ])
  end

  it "renders a list of departaments" do
    render
    assert_select "tr>td", text: nil.to_s, count: 2
    assert_select "tr>td", text: "Name".to_s, count: 2
  end
end
