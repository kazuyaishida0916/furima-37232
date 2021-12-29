FactoryBot.define do
  factory :card_address do
    post_code { '123-4567' }
    prefecture_id { 1 }
    city { '東京都' }
    address { '港区' }
    phone_number { '09012345678' }
    building_name { 'あ' }
    token { 'tok_abcdefghijk00000000000000000' }
  end
end
