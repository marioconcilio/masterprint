FactoryGirl.define do
  factory :tiktak_calendario, :class => Tiktak::Calendario do
    pagina { Faker::Lorem.word }
<<<<<<< HEAD
    referencia { Faker::Lorem.word }
=======
    referencia { Faker::Lorem.sentence }
>>>>>>> c7b0b308ab5189b7fb0c8c68d116183e37300186
    descricao { Faker::Lorem.sentence }
    preco { Faker::Number.decimal(3, 2) }
    un { Faker::Lorem.word }

    tipo do
<<<<<<< HEAD
      Tiktak::Calendario.tipos.keys.sample
    end
  end

  factory :invalid_tiktak_calendario, parent: :tiktak_calendario do
    pagina nil
=======
      Tiktak::Calendario.tipos.values.sample
    end
>>>>>>> c7b0b308ab5189b7fb0c8c68d116183e37300186
  end
end
