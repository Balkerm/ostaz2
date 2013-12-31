require 'spec_helper'

describe "accounts/new" do
  before(:each) do
    assign(:account, stub_model(Account,
      :name => "MyString",
      :description => "MyString",
      :balance => 1.5,
      :AccountType_id => ""
    ).as_new_record)
  end

  it "renders new account form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", accounts_path, "post" do
      assert_select "input#account_name[name=?]", "account[name]"
      assert_select "input#account_description[name=?]", "account[description]"
      assert_select "input#account_balance[name=?]", "account[balance]"
      assert_select "input#account_AccountType_id[name=?]", "account[AccountType_id]"
    end
  end
end
