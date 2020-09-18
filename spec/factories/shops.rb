FactoryBot.define do
  factory :shop do
    name                   { 'ラーメン' }
    text                   { 'ラーメンです' }
    address                { '東京都立川市1-1-1' }
    latitude               { '35.111' }
    longitude              { '135.111' }
    category_id            { '1' }
    user_id                { '1' }
    association :user
    after(:build) do |item|
    shop.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end