FactoryGirl.define do
  factory :chapa do
    larg { Faker::Number.number(3) }
    comp { Faker::Number.number(3) }
    qtde { Faker::Number.number(3) }
    moeda { ['BRL', 'USD'].sample }
    chapa_marca { FactoryGirl.create(:chapa_marca) }
  end

  factory :chapa_brl, parent: :chapa do
    moeda 'BRL'
  end

  factory :chapa_usd, parent: :chapa do
    moeda 'USD'
  end
end
