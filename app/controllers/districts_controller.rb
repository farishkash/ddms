class DistrictsController < ApplicationController
  def index
    @districts = District.all
  end
  
  def new
    @district = District.new
  end
  def show
    @district = District.find(params[:id])
    @schools = @district.schools
  end


  private
  def district_params
    params.require(:district).permit(:district_name,
                                    schools_attributes:[:id, :school_name])
  end
end
