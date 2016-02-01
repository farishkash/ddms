class Document < ActiveRecord::Base
	resourcify
  belongs_to :project

  has_attached_file :doc
  validates_attachment :doc,
    :content_type => { :content_type => %w(application/pdf application/msword application/vnd.openxmlformats-officedocument.wordprocessingml.document) }
end
