FactoryBot.define do
  factory :user do
    person = Gimei.name 
    
    nickname              {Faker::Name.initials(number: 2)}
    email                 {Faker::Internet.free_email}
    password              {Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    family_name           {person.last.kanji}
    first_name            {person.first.kanji}
    read_family           {person.last.katakana}
    read_first            {person.first.katakana}
    birth                 {Faker::Date.backward}
  end
end