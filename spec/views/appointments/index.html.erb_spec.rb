require 'rails_helper'

RSpec.describe "appointments/index", type: :view do
  before(:each) do
    assign(:appointments, [
      Appointment.create!(
        :appointment_type => 2,
        :user => nil
      ),
      Appointment.create!(
        :appointment_type => 2,
        :user => nil
      )
    ])
  end

  it "renders a list of appointments" do
    render
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
