class CreateDocuments < ActiveRecord::Migration
  def change
    create_table :documents do |t|
      t.string :document_name
      t.text :document_description

      t.timestamps null: false
    end
  end
end
