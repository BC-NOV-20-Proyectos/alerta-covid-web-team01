FactoryBot.define do
    factory :area do
      institution_id { institution.id }
      name { "area test" }
    end
  end