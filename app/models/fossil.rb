class Fossil < ActiveRecord::Base

  validates_presence_of :collection, :name, :upload_user_id
  validates_attachment_presence :attachment
  
 # validates_attachment_presence :attachment
  
  belongs_to :collection
  has_many :download_counters, :dependent => :destroy
  
  has_attached_file :attachment,
                    :url => "/collections/:collection_id/files/:id/download",
                    :path => ':rails_root/assets/:class/:id/:style/:filename'

  
end
