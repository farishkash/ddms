class School < ActiveRecord::Base
  belongs_to :district, inverse_of: :schools
  has_many :projects
  accepts_nested_attributes_for :district
end
