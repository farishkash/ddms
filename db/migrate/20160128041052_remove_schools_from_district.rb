class RemoveSchoolsFromDistrict < ActiveRecord::Migration
  def change
  	remove_column :districts, :schools_id
  end
end
