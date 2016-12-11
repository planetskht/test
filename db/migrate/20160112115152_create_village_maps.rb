class CreateVillageMaps < ActiveRecord::Migration
  def change
    create_table :village_maps do |t|
      t.string :title
      t.text :village_name
      t.string :map_type, default: "Village Map"
      t.references :sub_project, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
