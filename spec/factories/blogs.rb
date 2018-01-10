FactoryBot.define do
  factory :blog do
    name { Faker::Lorem.word }
    title { Faker::Lorem.sentence 2 }
    subtitle { Faker::Lorem.sentence }
    description { Faker::Lorem.paragraph }
    user_id 'a895d056dbb04b56ac19404171a42480'
  end
end
