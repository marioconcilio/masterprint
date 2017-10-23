FactoryGirl.define do
  factory :tiktak_calendario, :class => Tiktak::Calendario do
    pagina { Faker::Lorem.word }
    referencia { Faker::Lorem.sentence }
    descricao { Faker::Lorem.sentence }
    preco { Faker::Number.decimal(3, 2) }
    un { Faker::Lorem.word }

    tipo do
      Tiktak::Calendario.tipos.values.sample
    end
  end
end
