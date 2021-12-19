FactoryBot.define do
  factory :item do

item_name        {"ああああ"}
item_detail      {"ああああ"}
item_category_id  {2}
item_condition_id {2}
shipping_cost_id  {2}
prefecture_id     {1}
shipping_days_id  {1}
item_price        {"9999"}
association :user 
after(:build) do |message|
  message.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
end
  end
end
