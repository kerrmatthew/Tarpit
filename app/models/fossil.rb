class Fossil < ActiveRecord::Base

#  validates_presence_of :collection, :name, :upload_user_id
  validates_attachment_presence :attachment
  
#   validates_each :upload_user_id do |record, attr, value|
#     record.errors.add(attr, "#{value.name} is not allowed to upload to the collection: #{record.collection.name}") unless value.can_upload_collections.include?(record.collection)
#   end
  
 # validates_attachment_presence :attachment
  
  belongs_to :upload_user, :class_name => 'User', :foreign_key => :upload_user_id
  
  belongs_to :collection
  has_many :download_counters
  
  has_attached_file :attachment,
                    :url => "/files/:id/download/:style",
                    :path => ':rails_root/assets/:class/:id/:style/:filename',
                    :styles => {:thumb => "55x69#" }

  def attachment_is_image? 
    return true if attachment_content_type =~ /.*image.*/
    false
  end
  
end
