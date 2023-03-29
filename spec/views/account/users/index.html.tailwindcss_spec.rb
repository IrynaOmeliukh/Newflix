require 'rails_helper'

RSpec.describe "account/users/index", type: :view do
  before(:each) do
    assign(:account_users, [
      Account::User.create!(),
      Account::User.create!()
    ])
  end

  it "renders a list of account/users" do
    render
    cell_selector = Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
  end
end
