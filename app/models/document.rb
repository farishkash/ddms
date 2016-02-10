class Document < ActiveRecord::Base
	resourcify
  belongs_to :project

  has_attached_file :doc,
  :path => "#{Rails.root}/public/system/:class/:attachment/:id_partition/:style/:filename"
  #:url => "/system/:attachment/:id/:style/:filename"

  validates_attachment :doc
  do_not_validate_attachment_file_type :doc
    #:content_type => { :content_type => %w(application/pdf application/msword application/vnd.openxmlformats-officedocument.wordprocessingml.document) }
end
