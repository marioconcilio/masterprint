FactoryGirl.define do
  factory :tiktak_calendario, :class => Tiktak::Calendario do
    pagina { Faker::Lorem.word }
    referencia { Faker::Lorem.word }
    descricao { Faker::Lorem.sentence }
    preco { Faker::Number.decimal(3, 2) }
    un { Faker::Lorem.word }

    tipo do
      Tiktak::Calendario.tipos.keys.sample
    end
  end

  factory :invalid_tiktak_calendario, parent: :tiktak_calendario do
    pagina nil
  end
end
