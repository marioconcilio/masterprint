FactoryGirl.define do
  factory :grafiara_luto, :class => Grafiara::Luto do
    pagina { Faker::Lorem.word }
    referencia { Faker::Lorem.word }
    descricao { Faker::Lorem.sentence }
    preco { Faker::Number.decimal(3, 2) }
    qtde { Faker::Number.number(5) }
    un { Faker::Lorem.word }
  end
end
