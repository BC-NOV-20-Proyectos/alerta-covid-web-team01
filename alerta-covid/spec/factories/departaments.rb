FactoryBot.define do
  factory :departament do
    institution { institution.id }
    name { "Departament test" }
  end
end
