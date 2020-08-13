require 'rails_helper'

RSpec.describe "users/edit", type: :view do
  before(:each) do
    @user = assign(:user, User.create!(
      :admin => false,
      :name => "MyString",
      :position => "MyString",
      :department => "MyString",
      :workload => 1
    ))
  end

  it "renders the edit user form" do
    render

    assert_select "form[action=?][method=?]", user_path(@user), "post" do

      assert_select "input[name=?]", "user[admin]"

      assert_select "input[name=?]", "user[name]"

      assert_select "input[name=?]", "user[position]"

      assert_select "input[name=?]", "user[department]"

      assert_select "input[name=?]", "user[workload]"
    end
  end
end
