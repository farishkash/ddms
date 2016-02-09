class User < ActiveRecord::Base
  after_create :default_district
  after_create :assign_user_role
  belongs_to :district

  rolify
  accepts_nested_attributes_for :roles,
                                allow_destroy: true,
                                reject_if: ->(hash){ hash["_keep"] != "1" }

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  
  private
  def default_district
  	self.district_id ||= 10
  end
  
  def assign_user_role
    self.add_role "user"

  end
end
