class ProjectsController < ApplicationController
  load_and_authorize_resource
  def index
    @projects = Project.accessible_by(current_ability).order(:project_name)


  end

  def new
    @project = Project.new
  end
  def show
    @project = Project.find(params[:id])
    

  end
  def create
    @project = Project.create(project_params)
    if @project.save
      redirect_to '/projects' 
    else
      flash[:danger]="Please make sure to fill out form completely."
      #flash[:danger]=@project.errors.full_messages_for(:project_name)
      #flash[:danger]=@project.errors.full_messages_for(:district_id)
      #flash[:danger]=@project.errors.full_messages_for(:school_id)
      render 'new'
    end
  end
  def update
    

    if @project.update_attributes(project_params)
      flash[:success] = "The Project has been updated."
      redirect_to @project
    else
      flash[:danger]="Please make sure to fill out form completely."
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
