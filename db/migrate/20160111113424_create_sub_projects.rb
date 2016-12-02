class CreateSubProjects < ActiveRecord::Migration
  def change
    create_table :sub_projects do |t|
      t.string :name
      t.string :description
      t.belongs_to :project, index: true, foreign_key: true
      t.timestamps null: false
    end
  end
end
