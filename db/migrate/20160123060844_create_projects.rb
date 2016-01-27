class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :project_name
      t.text :project_scope
      t.string :dsa_number

      t.timestamps null: false
    end
  end
end
