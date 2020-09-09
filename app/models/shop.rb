class Shop < ApplicationRecord
  has_many :menus
  has_many :reviews
  geocoded_by :address
  after_validation :geocode, if: :address_changed?
end
