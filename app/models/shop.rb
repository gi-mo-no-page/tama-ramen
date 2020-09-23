class Shop < ApplicationRecord
  has_many :menus, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_many :goods, dependent: :destroy
  has_many :wents, dependent: :destroy
  has_one_attached :image, dependent: :destroy
  geocoded_by :address
  belongs_to :category
  belongs_to :user
  after_validation :geocode, if: :address_changed?

  with_options presence: true do
    validates :image
    validates :name
    validates :text
    validates :address
    validates :category_id
    validates :user_id
  end
end
