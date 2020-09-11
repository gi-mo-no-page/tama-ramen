class RemoveGenreIdrFromShops < ActiveRecord::Migration[6.0]
  def change
    remove_column :shops, :genre_id, :integer
  end
end
