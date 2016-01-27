class AddProjectToDocuments < ActiveRecord::Migration
  def change
    add_reference :documents, :project, index: true
    add_foreign_key :documents, :projects
  end
end
