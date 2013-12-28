require 'spec_helper'

describe "account_types/edit" do
  before(:each) do
    @account_type = assign(:account_type, stub_model(AccountType,
      :name => "MyString",
      :description => "MyText"
    ))
  end

  it "renders the edit account_type form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", account_type_path(@account_type), "post" do
      assert_select "input#account_type_name[name=?]", "account_type[name]"
      assert_select "textarea#account_type_description[name=?]", "account_type[description]"
    end
  end
end
