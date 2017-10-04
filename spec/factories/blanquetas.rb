FactoryGirl.define do
  factory :blanqueta do
    larg { Faker::Number.number(3) }
    comp { Faker::Number.number(3) }
    qtde { Faker::Number.number(3) }
    nome { Faker::Lorem.word }
    moeda { ['BRL', 'USD'].sample }
    blanqueta_lona { FactoryGirl.create(:blanqueta_lona) }
  end

  factory :blanqueta_brl, parent: :blanqueta do
    moeda 'BRL'
  end

  factory :blanqueta_usd, parent: :blanqueta do
    moeda 'USD'
  end
end
