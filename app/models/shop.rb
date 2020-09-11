class Shop < ApplicationRecord
  has_many :menus
  has_many :reviews
  has_many :goods
  has_many :wents
  has_one_attached :image
  geocoded_by :address
  belongs_to :category
  belongs_to :user
  after_validation :geocode, if: :address_changed?
end
