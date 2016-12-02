class CreateBenchMarks < ActiveRecord::Migration
  def change
    create_table :bench_marks do |t|
      t.string :title
      t.text :description
      t.references :sub_project, index: true, foreign_key: true
      t.string :type

      t.timestamps null: false
    end
  end
end
