FactoryGirl.define do
  factory :blanqueta_lona do
    lonas { Faker::Number.number(3) }
    preco { Faker::Number.decimal(2) }
  end
end
