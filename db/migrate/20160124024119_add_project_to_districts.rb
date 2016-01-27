class AddProjectToDistricts < ActiveRecord::Migration
  def change
    add_reference :districts, :project, index: true
    add_foreign_key :districts, :projects
  end
end
