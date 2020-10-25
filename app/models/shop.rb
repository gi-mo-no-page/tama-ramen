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

  def set_areas
    @north_tama_areas = %w[西東京市 東久留米市 清瀬市 東村山市 小平市 東大和市 武蔵村山市]
  end
end
