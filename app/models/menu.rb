class Menu < ApplicationRecord
  belongs_to :shop
  belongs_to :user

  with_options presence: true do
    validates :name
    validates :price, format: { with: /\A[0-9]+\z/ }
    validates :shop_id
    validates :user_id
  end

end
