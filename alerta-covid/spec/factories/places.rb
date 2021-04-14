FactoryBot.define do
  factory :place do
    name { "Test place" }
    qr_code { "Test QR code" }
    area
  end
end
