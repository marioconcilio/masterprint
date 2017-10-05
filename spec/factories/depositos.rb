FactoryGirl.define do
  factory :repasse do
    titular { Faker::Name.name }
    total { Faker::Number.decimal(8,2) }
  end

  factory :deposito, parent: :repasse do
    banco { Faker::Number.number(3) }
    agencia { Faker::Number.number(4) }
    conta { Faker::Lorem.characters(10) }
  end
end
