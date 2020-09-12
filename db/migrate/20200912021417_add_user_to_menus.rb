class AddUserToMenus < ActiveRecord::Migration[6.0]
  def change
    add_reference :menus, :user, null: false, foreign_key: true
  end
end
