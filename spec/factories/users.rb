FactoryBot.define do
  factory :user do
    nickname              { 'yamada' }
    email                 { 'aaaaaaa@gmail.com' }
    password              { '123yamada' }
    password_confirmation { password }

    
  end
end