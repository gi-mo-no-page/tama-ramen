class Shop < ApplicationRecord
  has_many :menus
  has_many :reviews
  has_one_attached :image
  geocoded_by :address
  after_validation :geocode, if: :address_changed?
end
