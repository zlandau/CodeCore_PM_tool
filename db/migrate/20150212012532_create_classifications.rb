class CreateClassifications < ActiveRecord::Migration
  def change
    create_table :classifications do |t|
      t.references :project, index: true
      t.references :tag, index: true

      t.timestamps null: false
    end
    add_foreign_key :classifications, :projects
    add_foreign_key :classifications, :tags
  end
end
