require 'rails_helper'

RSpec.describe "account/users/new", type: :view do
  before(:each) do
    assign(:account_user, Account::User.new())
  end

  it "renders new account_user form" do
    render

    assert_select "form[action=?][method=?]", account_users_path, "post" do
    end
  end
end
