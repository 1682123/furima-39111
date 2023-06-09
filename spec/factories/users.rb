FactoryBot.define do
  factory :user do
    japanese_user = Gimei.name
    nickname {Faker::Name.last_name}
    email {Faker::Internet.free_email}
    password {'1a' + Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    last_name { japanese_user.first.kanji }
    first_name { japanese_user.last.kanji }
    last_name_kana { japanese_user.first.katakana }
    first_name_kana { japanese_user.last.katakana }
    birthday {Faker::Date.birthday(min_age: 18, max_age: 65)}
  end
end
