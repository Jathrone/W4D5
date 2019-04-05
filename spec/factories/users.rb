FactoryBot.define do
  factory :user do
    username { "" }
    session_token { "MyString" }
    password_digest { "MyString" }
  end
end
