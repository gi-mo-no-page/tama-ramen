class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         has_many :reviews
         has_many :goods
         has_many :wents
         has_many :shops

         has_one_attached :avatar

         def self.guest
          find_or_create_by!(email: 'guest@example.com') do |user|
            user.password = SecureRandom.urlsafe_base64
            user.nickname = "ゲストユーザー"
          end
         end

         validates :nickname, presence: true
end
