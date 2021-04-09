FactoryBot.define do
  factory :area do
    institution { institution.id }
    name { "Institution factory" }
  end
end
