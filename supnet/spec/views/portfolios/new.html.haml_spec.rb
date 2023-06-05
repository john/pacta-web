require 'rails_helper'

RSpec.describe "portfolios/new", type: :view do
  before(:each) do
    assign(:portfolio, Portfolio.new(
      name: "MyString",
      email: "test@test.com",
      description: "MyText",
      api_endpoint: "MyString",
      api_key: "MyString"
    ))
  end

  it "renders new portfolio form" do
    render

    assert_select "form[action=?][method=?]", portfolios_path, "post" do

      assert_select "input[name=?]", "portfolio[name]"

      assert_select "input[name=?]", "portfolio[email]"

      assert_select "textarea[name=?]", "portfolio[description]"

      assert_select "input[name=?]", "portfolio[api_endpoint]"

      assert_select "input[name=?]", "portfolio[api_key]"
    end
  end
end
