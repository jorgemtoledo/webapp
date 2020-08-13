require 'rails_helper'

RSpec.describe "users/index", type: :view do
  before(:each) do
    assign(:users, [
      User.create!(
        :admin => false,
        :name => "Name",
        :position => "Position",
        :department => "Department",
        :workload => 2
      ),
      User.create!(
        :admin => false,
        :name => "Name",
        :position => "Position",
        :department => "Department",
        :workload => 2
      )
    ])
  end

  it "renders a list of users" do
    render
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Position".to_s, :count => 2
    assert_select "tr>td", :text => "Department".to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
  end
end
