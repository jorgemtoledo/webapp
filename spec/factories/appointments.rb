FactoryBot.define do
  factory :appointment do
    appointment_date { "2020-08-13 19:04:26" }
    appointment_type { 1 }
    user { nil }
  end
end
