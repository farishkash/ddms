class ProjectsController < ApplicationController
  load_and_authorize_resource
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
    @documents = @project.documents

  end
  def create
    @project = Project.new(project_params)
    if @project.save
      redirect_to '/projects' 
    else
      render 'new'
    end
  end
  def update
    

    if @project.update_attributes(project_params)
      flash[:success] = "The Project has been updated."
      redirect_to @project
    else
      render 'edit'
    end
  end

  private
  def project_params
    params.require(:project).permit(:project_name, :project_scope, :dsa_number,:school_id, :district_id, :document_id,
                                     district_attributes:[:id, :district_name],
                                     schools_attributes:[:id, :school_name])
  end
end
