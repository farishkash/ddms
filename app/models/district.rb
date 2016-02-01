class District < ActiveRecord::Base
	has_many :users
	resourcify
  has_many :projects, inverse_of: :district
  has_many :schools, inverse_of: :district
end
