require 'rails_helper'

RSpec.describe "users/show", type: :view do
  before(:each) do
    @user = assign(:user, User.create!(
      :admin => false,
      :name => "Name",
      :position => "Position",
      :department => "Department",
      :workload => 2
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/false/)
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Position/)
    expect(rendered).to match(/Department/)
    expect(rendered).to match(/2/)
  end
end
