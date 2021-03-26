require 'rails_helper'

RSpec.describe "departaments/edit", type: :view do
  before(:each) do
    @departament = assign(:departament, Departament.create!(
      institution: nil,
      name: "MyString"
    ))
  end

  it "renders the edit departament form" do
    render

    assert_select "form[action=?][method=?]", departament_path(@departament), "post" do

      assert_select "input[name=?]", "departament[institution_id]"

      assert_select "input[name=?]", "departament[name]"
    end
  end
end
