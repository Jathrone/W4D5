FactoryBot.define do
  factory :user do
    username { Faker::Name.name }
    password { "password" }
    # session_token { }
    # password_digest { }
  end
end
