FactoryGirl.define do
  factory :recado do
    titulo { Faker::Lorem.word }
    texto { Faker::Lorem.paragraph }
  end
end
