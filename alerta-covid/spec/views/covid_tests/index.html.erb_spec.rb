require 'rails_helper'

RSpec.describe "covid_tests/index", type: :view do
  before(:each) do
    assign(:covid_tests, [
      CovidTest.create!(
        name: "Name"
      ),
      CovidTest.create!(
        name: "Name"
      )
    ])
  end

  it "renders a list of covid_tests" do
    render
    assert_select "tr>td", text: "Name".to_s, count: 2
  end
end
