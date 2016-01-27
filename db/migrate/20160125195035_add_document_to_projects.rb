class AddDocumentToProjects < ActiveRecord::Migration
  def change
    add_reference :projects, :document, index:true
    add_foreign_key :projects, :documents
  end
end
