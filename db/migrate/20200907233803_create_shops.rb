class CreateShops < ActiveRecord::Migration[6.0]
  def change
    create_table :shops do |t|
      t.string :name,           null: false
      t.text :text,             null: false
      t.string :genre,          null: false
      t.string :area,           null: false
      t.timestamps
    end
  end
end
