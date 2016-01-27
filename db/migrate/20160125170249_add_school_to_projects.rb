class AddSchoolToProjects < ActiveRecord::Migration
  def change
    add_reference :projects, :school, index: true
    add_foreign_key :projects, :schools
  end
end
