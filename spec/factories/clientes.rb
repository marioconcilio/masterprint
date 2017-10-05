FactoryGirl.define do
  factory :cliente do
    transient do
      company_name { Faker::Company.name }
    end

    id { Faker::Number.number(14) }
    ie { Faker::Number.number(12) }
    razao_social { company_name }
    nome { company_name }
    endereco { Faker::Address.street_address }
    cidade { Faker::Address.city }
    uf { Faker::Address.state_abbr }
    cep { Faker::Number.number(8) }
    contato { Faker::Name.first_name }
    telefone { Faker::PhoneNumber.phone_number }
    celular { Faker::PhoneNumber.phone_number }
    email { Faker::Internet.email }
  end
end
