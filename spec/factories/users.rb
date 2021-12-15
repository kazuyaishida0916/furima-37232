FactoryBot.define do
  factory :user do
    nickname {Faker::Name.initials(number: 2)}
    email {Faker::Internet.free_email}
    password {Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    last_name {"佐藤"}
    first_name{"加藤"}
    last_name_kana{"サトウ"}
    first_name_kana{"カトウ"}
    birth_day{"1931-02-01"}
  end
end