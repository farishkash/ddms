class AddDistrictToSchools < ActiveRecord::Migration
  def change
    add_reference :schools, :district, index: true
    add_foreign_key :schools, :districts
  end
end
