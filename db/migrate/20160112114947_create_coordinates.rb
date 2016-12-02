class CreateCoordinates < ActiveRecord::Migration
  def change
    create_table :coordinates do |t|
      t.string :title
      t.text :description
      t.string :east_utm
      t.string :north_utm
      t.string :lattitude
      t.string :longitude
      t.string :time_zone
      t.references :sub_project, index: true, foreign_key: true
      t.timestamps null: false
    end
  end
end
