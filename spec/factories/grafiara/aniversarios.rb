FactoryGirl.define do
  factory :grafiara_aniversario, :class => Grafiara::Aniversario do
    pagina { Faker::Lorem.word }
    codigo { Faker::Lorem.sentence }
    preco { Faker::Number.decimal(3, 2) }
    un { Faker::Lorem.word }
  end
end
