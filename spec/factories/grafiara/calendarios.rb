FactoryGirl.define do
  factory :grafiara_calendario, :class => Grafiara::Calendario do
    pagina { Faker::Lorem.word }
    referencia { Faker::Lorem.sentence }
    descricao { Faker::Lorem.sentence }
    preco { Faker::Number.decimal(3, 2) }
    un { Faker::Lorem.word }
  end
end
