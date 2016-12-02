class CreateCustomMenus < ActiveRecord::Migration
  def change
    create_table :custom_menus do |t|
      t.string :menu_name
      t.string :sub_menu_name
      t.string :attachment_type
      t.belongs_to :sub_project, index: true, foreign_key: true
      t.timestamps null: false
    end
  end
end
