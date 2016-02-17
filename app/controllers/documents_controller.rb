class DocumentsController < ApplicationController
  load_and_authorize_resource
  def index
  @documents = Document.all
  end

  def new
    @document = Document.new
  end
  def show
    @document= Document.find(params[:id])
    
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

  def update
    

    if @document.update_attributes(document_params)
      flash[:success] = "The Document has been updated."
      redirect_to @document
    else
      flash[:danger]="Please make sure to fill out form completely."
      render 'edit'
    end
  end
  
  private
  def document_params
    params.require(:document).permit(:doc, :document_name, :document_description,:project_id)
  end
  
end
