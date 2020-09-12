class Good < ApplicationRecord
  belongs_to :shop
  belongs_to :user

  with_options presence: true do
    validates :shop_id
    validates :user_id
  end

end
