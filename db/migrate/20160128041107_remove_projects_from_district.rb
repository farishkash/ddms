class RemoveProjectsFromDistrict < ActiveRecord::Migration
  def change
  	remove_column :districts, :projects_id
  end
end
