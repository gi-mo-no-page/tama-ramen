FactoryBot.define do
  factory :shop do
    name                   { 'ラーメン' }
    text                   { 'ラーメンです' }
    address                { '東京都立川市1-1-1' }
    latitude               { '35.111' }
    longitude              { '135.111' }
    category_id            { '4' }
    user_id                { '1' }
    association :user
    association :category

    after(:build) do |shop|
    shop.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
    
  end
end