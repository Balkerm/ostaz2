require 'spec_helper'

describe "accounts/edit" do
  before(:each) do
    @account = assign(:account, stub_model(Account,
      :name => "MyString",
      :description => "MyString",
      :balance => 1.5,
      :AccountType_id => ""
    ))
  end

  it "renders the edit account form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", account_path(@account), "post" do
      assert_select "input#account_name[name=?]", "account[name]"
      assert_select "input#account_description[name=?]", "account[description]"
      assert_select "input#account_balance[name=?]", "account[balance]"
      assert_select "input#account_AccountType_id[name=?]", "account[AccountType_id]"
    end
  end
end
