FactoryBot.define do
  factory :user do
    nickname              { 'yamada' }
    email                 { 'aaaaaaa@gmail.com' }
    text                  { 'こんにちは' }
    password              { '123yamada' }
    password_confirmation { password }

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
    
  end
end