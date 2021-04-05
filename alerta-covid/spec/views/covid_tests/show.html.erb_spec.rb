require 'rails_helper'

RSpec.describe "covid_tests/show", type: :view do
  before(:each) do
    @covid_test = assign(:covid_test, CovidTest.create!(
      name: "Name"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
  end
end
