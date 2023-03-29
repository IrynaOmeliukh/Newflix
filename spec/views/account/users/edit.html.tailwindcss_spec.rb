require 'rails_helper'

RSpec.describe "account/users/edit", type: :view do
  let(:account_user) {
    Account::User.create!()
  }

  before(:each) do
    assign(:account_user, account_user)
  end

  it "renders the edit account_user form" do
    render

    assert_select "form[action=?][method=?]", account_user_path(account_user), "post" do
    end
  end
end
