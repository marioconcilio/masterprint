FactoryGirl.define do
  factory :usuario do
    transient do
      name { Faker::Name.name_with_middle().split(' ').drop(1).join(' ') }
    end

    # to ensure uniqueness, since usuario must be unique
    usuario { name.split[0].downcase + SecureRandom.uuid }
    nome { name }
    password { Faker::Lorem.characters(10) }
  end

  factory :admin, parent: :usuario do
    admin true
  end

  factory :usuario_teste, parent: :usuario do
    nome 'Teste da Silva'
    usuario 'teste'
    password 'teste123'
  end
end
