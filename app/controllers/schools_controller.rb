class SchoolsController < ApplicationController

  load_and_authorize_resource
  
  def index
 #@schools = current_user.district.schools
 @schools = School.accessible_by(current_ability).order(:school_name)
  end
  
  def new
    @school = School.new
  end
  
  def show
    @school = School.find(params[:id])
    @district = @school.district
    @projects = @school.projects
  end
  
  def create
    @school = School.create(school_params)
    if @school.save
      redirect_to '/schools'
    else
      flash[:danger]="Please make sure to fill out form completely."
      render 'new'
    end
  end
  
  def update
    
    if @school.update_attributes(school_params)
      flash[:success] = "The School has been updated."
      redirect_to @school
    else
      flash[:danger]="Please make sure to fill out form completely."
      render 'edit'
    end
  end 
  
  private
  def school_params
    params.require(:school).permit(:school_name, :school_location, :district_id,
                                   district_attributes:[:id, :district_name])
                                  
  end
end
