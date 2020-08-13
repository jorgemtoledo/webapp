FactoryBot.define do
  factory :user do
    admin { false }
    name { "MyString" }
    position { "MyString" }
    department { "MyString" }
    workload { 1 }
  end
end
