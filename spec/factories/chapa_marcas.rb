FactoryGirl.define do
  factory :chapa_marca do
    marca { Faker::Lorem.word }
    preco { Faker::Number.decimal(2) }
    esp { Faker::Lorem.word }
  end
end
