require 'rails_helper'

RSpec.describe "portfolios/edit", type: :view do
  let(:portfolio) {
    Portfolio.create!(
      name: "MyString",
      email: "test@test.com",w
      description: "MyText",
      api_endpoint: "MyString",
      api_key: "MyString"
    )
  }

  before(:each) do
    assign(:portfolio, portfolio)
  end

  it "renders the edit portfolio form" do
    skip

    # render

    # assert_select "form[action=?][method=?]", portfolio_path(portfolio), "post" do

    #   assert_select "input[name=?]", "portfolio[name]"

    #   assert_select "input[name=?]", "portfolio[email]"

    #   assert_select "textarea[name=?]", "portfolio[description]"

    #   assert_select "input[name=?]", "portfolio[api_endpoint]"

    #   assert_select "input[name=?]", "portfolio[api_key]"
    # end
  end
end
