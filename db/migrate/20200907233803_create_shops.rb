class CreateShops < ActiveRecord::Migration[6.0]
  def change
    create_table :shops do |t|
      t.string :name,           null: false
      t.text :text,             null: false
      t.string :genre,          null: false
      t.string :address,        null: false
      t.float :latitude,        null: false
      t.float :longitude,       null: false
      t.timestamps
    end
  end
end
