FactoryGirl.define do
  factory :recado do
    titulo { Faker::Lorem.word }
    texto { Faker::Lorem.paragraph }

    remetente do
      FactoryGirl.create(:usuario)
    end
  end

  factory :recado_recent, parent: :recado do
    updated_at { Faker::Date.between(Date.today.beginning_of_week, Date.today) }
  end

  factory :recado_old, parent: :recado do
    updated_at { Faker::Date.between(1.year.ago, Date.today.beginning_of_week - 2) }
  end

  factory :recado_done, parent: :recado do
    done { true }
  end

  factory :recado_done_recent, parent: :recado_done do
    updated_at { Faker::Date.between(Date.today.beginning_of_week, Date.today) }
  end

  factory :recado_done_old, parent: :recado_done do
    updated_at { Faker::Date.between(1.year.ago, Date.today - 1) }
  end

  factory :invalid_recado, parent: :recado do
    texto { nil }
  end
end
