require 'rails_helper'

RSpec.describe "users/new", type: :view do
  before(:each) do
    assign(:user, User.new(
      :admin => false,
      :name => "MyString",
      :position => "MyString",
      :department => "MyString",
      :workload => 1
    ))
  end

  it "renders new user form" do
    render

    assert_select "form[action=?][method=?]", users_path, "post" do

      assert_select "input[name=?]", "user[admin]"

      assert_select "input[name=?]", "user[name]"

      assert_select "input[name=?]", "user[position]"

      assert_select "input[name=?]", "user[department]"

      assert_select "input[name=?]", "user[workload]"
    end
  end
end
