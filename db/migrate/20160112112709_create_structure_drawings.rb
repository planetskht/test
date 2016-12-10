class CreateStructureDrawings < ActiveRecord::Migration
  def change
    create_table :structure_drawings do |t|
      t.string :title
      t.text :description
      t.references :sub_project, index: true, foreign_key: true
      t.string :type
      t.string :structure_type
      t.timestamps null: false
    end
  end
end
