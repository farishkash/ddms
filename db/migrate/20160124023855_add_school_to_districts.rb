class AddSchoolToDistricts < ActiveRecord::Migration
  def change
    add_reference :districts, :school, index: true
    add_foreign_key :districts, :schools
  end
end
