class Document < ActiveRecord::Base
	resourcify
  belongs_to :project

  has_attached_file :doc,
  :path => ":rails_root/public/system/:class/:attachment/:id_partition/:style/:filename",
  :url => "/system/:attachment/:id/:style/:filename"

  validates_attachment :doc
    validates_attachment_content_type :attachment, content_type: ['image/jpeg', 'image/png', 'image/gif', 'application/pdf']
end
