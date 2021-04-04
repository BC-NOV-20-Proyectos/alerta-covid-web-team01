require 'rails_helper'

RSpec.describe "covid_tests/new", type: :view do
  before(:each) do
    assign(:covid_test, CovidTest.new(
      name: "MyString"
    ))
  end

  it "renders new covid_test form" do
    render

    assert_select "form[action=?][method=?]", covid_tests_path, "post" do

      assert_select "input[name=?]", "covid_test[name]"
    end
  end
end
