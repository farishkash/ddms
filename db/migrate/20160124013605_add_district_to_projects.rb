class AddDistrictToProjects < ActiveRecord::Migration
  def change
    add_reference :projects, :district, index: true
    add_foreign_key :projects, :districts
  end
end
