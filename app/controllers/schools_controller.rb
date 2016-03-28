class SchoolsController < ApplicationController
  load_and_authorize_resource :except => :autocomplete_school_school_name
  
  autocomplete :school, :school_name
  

  
  def index
 
   @schools = School.accessible_by(current_ability).order(:school_name)
     if params[:search]
      #@school =School.name_like("%#{params[:search]}%").order('school_name')
       @school = School.find_by(school_name: params[:search])
       redirect_to school_path(@school)
       else
     end
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
  

  def get_autocomplete_items(parameters)
   items = active_record_get_autocomplete_items(parameters)
   items = School.accessible_by(current_ability).select("school_name, id").
            where(["LOWER(school_name) " + 
                   "LIKE LOWER(?)", "%#{parameters[:term]}%"])

  end
  
  private
  def school_params
    params.require(:school).permit(:school_name, :school_location, :district_id,
                                   district_attributes:[:id, :district_name])
                                  
  end
end
