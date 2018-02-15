FactoryGirl.define do
  factory :financeiro_pag_seguro, class: 'Financeiro::PagSeguro' do
    valor_bruto { Faker::Number.decimal(10, 2) }
    valor_taxa { Faker::Number.decimal(10, 2) }
    valor_liquido { Faker::Number.decimal(10, 2) }
    data { Faker::Date.backward(30) }
    parcelas { Faker::Number.between(1, 10) }
    bandeira { Faker::Lorem.word }

    tipo_pagamento do
      Financeiro::PagSeguro.tipo_pagamentos.keys.sample
    end
  end

  factory :invalid_pag_seguro, parent: :financeiro_pag_seguro do
    tipo_pagamento nil
  end
end
