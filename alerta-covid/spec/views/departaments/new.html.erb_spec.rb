require 'rails_helper'

RSpec.describe "departaments/new", type: :view do
  before(:each) do
    assign(:departament, Departament.new(
      institution: nil,
      name: "MyString"
    ))
  end

  it "renders new departament form" do
    render

    assert_select "form[action=?][method=?]", departaments_path, "post" do

      assert_select "input[name=?]", "departament[institution_id]"

      assert_select "input[name=?]", "departament[name]"
    end
  end
end
