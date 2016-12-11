class CreateHydralicParticulars < ActiveRecord::Migration
  def change
    create_table :hydralic_particulars do |t|
      t.string :from_km
      t.string :to_km
      t.string :title
      t.text :description
      t.references :sub_project, index: true, foreign_key: true
      t.string :type
      t.string :hydralic_type, default: "Canal"
      t.timestamps null: false
    end
  end
end
