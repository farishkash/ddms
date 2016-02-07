class Project < ActiveRecord::Base
	resourcify
  belongs_to :school
  belongs_to :district
  has_many :documents

  accepts_nested_attributes_for :district
  accepts_nested_attributes_for :school
  accepts_nested_attributes_for :documents

  validates_presence_of :project_name, :district_id, :school_id
 


 
end
