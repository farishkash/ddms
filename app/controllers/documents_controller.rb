class DocumentsController < ApplicationController
  def index
  
  end

  def new
    @document = Document.new
  end
  def show
    @document.find(params[:id])
    @project = @document.project
    @school = @document.school
    @district = @document.distict
  end

  def create
    @document = Document.new(document_params)
    if @document.save
      redirect_to root_path
    else
      render 'new'
    end
  end
  
  private
  def document_params
    params.require(:document).permit(:doc, :document_name, :document_description)
  end
  
end
