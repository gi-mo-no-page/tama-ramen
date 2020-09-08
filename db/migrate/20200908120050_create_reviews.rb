class CreateReviews < ActiveRecord::Migration[6.0]
  def change
    create_table :reviews do |t|
      t.string :title
      t.text :text
      t.float :rate
      t.references :user,    null: false, foreign_key: true 
      t.references :shop,    null: false, foreign_key: true 
      t.timestamps
    end
  end
end
