require 'rails_helper'

RSpec.describe "appointments/new", type: :view do
  before(:each) do
    assign(:appointment, Appointment.new(
      :appointment_type => 1,
      :user => nil
    ))
  end

  it "renders new appointment form" do
    render

    assert_select "form[action=?][method=?]", appointments_path, "post" do

      assert_select "input[name=?]", "appointment[appointment_type]"

      assert_select "input[name=?]", "appointment[user_id]"
    end
  end
end
