class Shop < ApplicationRecord
  has_many :menus
  has_many :reviews
end
