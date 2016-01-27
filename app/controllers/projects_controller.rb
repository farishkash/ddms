class ProjectsController < ApplicationController
  def index
    @projects = Project.all

  end

  def new
    @project = Project.new
  end
  def show
    @project = Project.find(params[:id])
    @school = @project.school
    @district = @school.district

  end
  def create
    @project = Project.new(project_params)
    if @project.save
      redirect_to '/projects' 
    else
      render 'new'
    end
  end 

  private
  def project_params
    params.require(:project).permit(:project_name, :project_scope, :dsa_number,:school_id, :district_id, :document_id,
                                     district_attributes:[:id, :district_name],
                                     schools_attributes:[:id, :school_name])
  end
end
