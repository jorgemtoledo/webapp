require 'rails_helper'

RSpec.describe "appointments/edit", type: :view do
  before(:each) do
    @appointment = assign(:appointment, Appointment.create!(
      :appointment_type => 1,
      :user => nil
    ))
  end

  it "renders the edit appointment form" do
    render

    assert_select "form[action=?][method=?]", appointment_path(@appointment), "post" do

      assert_select "input[name=?]", "appointment[appointment_type]"

      assert_select "input[name=?]", "appointment[user_id]"
    end
  end
end
