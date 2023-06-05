require 'rails_helper'

RSpec.describe "portfolios/index", type: :view do
  before(:each) do
    assign(:portfolios, [
      Portfolio.create!(
        name: "Name1",
        email: "Email1@test.com",
        description: "MyText",
        api_endpoint: "Api Endpoint",
        api_key: "Api Key"
      ),
      Portfolio.create!(
        name: "Name2",
        email: "Email2@test.com",
        description: "MyText",
        api_endpoint: "Api Endpoint",
        api_key: "Api Key"
      )
    ])
  end

  it "renders a list of portfolios" do
    pending "fix"
    render
    cell_selector = Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
    assert_select cell_selector, text: Regexp.new("Name".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Email".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("MyText".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Api Endpoint".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Api Key".to_s), count: 2
  end
end
