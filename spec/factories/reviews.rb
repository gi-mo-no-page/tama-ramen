FactoryBot.define do
  factory :review do
    title              { 'ラーメン' }
    text               { 'おいしい' }
    rate               { '5' }
    shop_id            { '1' }
    user_id            { '1' }
    association :user
    association :shop
  end
end
