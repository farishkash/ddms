class AddForeignKeyToDistricts < ActiveRecord::Migration
  def change
    add_reference :districts, :projects, index: true
    add_foreign_key :districts, :projects
    add_reference  :districts, :schools, index: true
    add_foreign_key :districts, :schools
  end
end
