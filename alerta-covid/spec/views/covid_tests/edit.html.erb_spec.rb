require 'rails_helper'

RSpec.describe "covid_tests/edit", type: :view do
  before(:each) do
    @covid_test = assign(:covid_test, CovidTest.create!(
      name: "MyString"
    ))
  end

  it "renders the edit covid_test form" do
    render

    assert_select "form[action=?][method=?]", covid_test_path(@covid_test), "post" do

      assert_select "input[name=?]", "covid_test[name]"
    end
  end
end
