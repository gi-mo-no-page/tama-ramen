class Review < ApplicationRecord
  belongs_to :user
  belongs_to :shop

  with_options presence: true do
    validates :title
    validates :text
    validates :rate
    validates :shop_id
    validates :user_id
  end

end
