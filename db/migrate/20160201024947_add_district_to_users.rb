class AddDistrictToUsers < ActiveRecord::Migration
  def change
  	add_reference :users, :district, index: true
    add_foreign_key :users, :districts
  end
end
