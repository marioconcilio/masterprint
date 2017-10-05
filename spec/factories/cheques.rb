FactoryGirl.define do
  factory :cheque do
    banco { Faker::Number.number(3) }
    numero { Faker::Number.number(6) }
    emitente { Faker::Name.name }
    valor { Faker::Number.decimal(8, 2) }
    data_deposito { Faker::Date.forward(90) }
    cliente { FactoryGirl.create :cliente }
    status { Cheque.status.keys.sample }
  end

  factory :cheque_repassado, parent: :cheque do
    deposito { FactoryGirl.create :repasse }
  end

  factory :cheque_depositado, parent: :cheque do
    deposito { FactoryGirl.create :deposito }
  end
end
