class AddCategoryToShops < ActiveRecord::Migration[6.0]
  def change
    add_reference :shops, :category, null: false, foreign_key: true
  end
end
