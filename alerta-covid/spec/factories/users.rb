FactoryBot.define do
  factory :user do
    email { 'user@email.com' }
    full_name { 'Full Name' }
    lastname { 'Last Name' }
    born_date { '10-02-1985' }
    gender { 'Male' }
  end
end
