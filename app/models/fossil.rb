class Fossil < ActiveRecord::Base

  validates_presence_of :collection, :name 
  validates_attachment_presence :attachment
  
 # validates_attachment_presence :attachment
  
  belongs_to :collection
  
  has_attached_file :attachment,
                    :url => "/collections/:collection_id/files/:id/download",
                    :path => ':rails_root/assets/:class/:id/:style/:filename'

  
end
