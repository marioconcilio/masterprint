FactoryGirl.define do
  factory :grafiara_casamento, :class => Grafiara::Casamento do
    pagina { Faker::Lorem.word }
    codigo { Faker::Lorem.word }
    descricao { Faker::Lorem.sentence }
    preco { Faker::Number.decimal(3, 2) }
    un { Faker::Lorem.word }
  end
end
