FactoryBot.define do
  factory :menu do
    name              { 'ラーメン' }
    price             { '1000' }
    shop_id           { '1' }
    user_id            { '1' }

    association :shop
    association :user

  end
end
