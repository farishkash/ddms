class DocumentsController < ApplicationController
  load_and_authorize_resource
  def index
  
  end

  def new
    @document = Document.new
  end
  def show
    @document= Document.find(params[:id])
    @project = @document.project
    @school = @project.school
    @district = @project.district
  end

  def create
    @document = Document.new(document_params)
    if @document.save
       @project = @document.project
      redirect_to @project
    else
      flash[:danger]= @document.errors.full_messages
      render 'new'
    end
  end
  
  private
  def document_params
    params.require(:document).permit(:doc, :document_name, :document_description,:project_id)
  end
  
end
