class SchoolsController < ApplicationController
  def index
    @schools = School.all.includes(:district)

  end
  def new
    @school = School.new
  end
  def show
    @school = School.find(params[:id])
    @district = @school.district
  end
  def create
    @school = School.create(school_params)
    if @school.save
      redirect_to '/schools' 
    else
      render 'new'
    end
  end 
  private
  def school_params
    params.require(:school).permit(:school_name, :school_location, :district_id,
                                   district_attributes:[:id, :district_name])
                                  
  end
end
