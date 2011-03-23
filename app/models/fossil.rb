class Fossil < ActiveRecord::Base

  validates_presence_of :collection, :name
  
 # validates_attachment_presence :attachment
  
  belongs_to :collection
  
  has_attached_file :attachment,
                    :url => '/:class/:id/:style.:extension',
                    :path => ':rails_root/assets/:class/:id_partition/:style/:filename'

  
end
