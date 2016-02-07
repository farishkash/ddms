class DistrictsController < ApplicationController
  load_and_authorize_resource
  def index
    @districts = District.all
  end
  
  def new
    @district = District.new
  end
  def show
    @district = District.find(params[:id])
    @schools = @district.schools.order(:school_name)
  end

 def create
    @district = District.create(district_params)
    if @district.save
      redirect_to '/districts' 
    else
      render 'new'
    end
 end 

 def update
    
    if @district.update_attributes(district_params)
      flash[:success] = "The District has been updated."
      redirect_to @district
    else
      render 'edit'
    end
  end 
  

  private
  def district_params
    params.require(:district).permit(:district_name,
                                    schools_attributes:[:id, :school_name])
  end
end
