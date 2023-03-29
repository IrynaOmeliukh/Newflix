require 'rails_helper'

RSpec.describe "account/users/show", type: :view do
  before(:each) do
    assign(:account_user, Account::User.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
