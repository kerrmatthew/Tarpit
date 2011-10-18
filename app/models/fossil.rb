class Fossil < ActiveRecord::Base

  validates_presence_of :collection, :name, :upload_user_id
  validates_attachment_presence :attachment
  
#    validates_each :upload_user_id do |record, attr, value|
#      record.errors.add(attr, "#{value.name} is not allowed to upload to the collection: #{record.collection.name}") unless value.can_upload_collections.include?(record.collection)
#    end
  
  validates_attachment_presence :attachment
  
  belongs_to :upload_user, :class_name => 'User', :foreign_key => :upload_user_id
  
  belongs_to :collection
  has_many :download_counters
  
  has_attached_file :attachment,
                    :url => "/files/:id/download/:style",
                    :path => ':rails_root/assets/:class/:id/:style/:filename',
                    :styles => {  :thumb => "45x45#",
                                  :preview => "128x128#"
                                }

  before_attachment_post_process :allow_only_images


  def attachment_is_image? 
    return true if attachment_content_type =~ /.*image.*/
    false
  end



  def allow_only_images
    if !(attachment.content_type =~ %r{^(image|(x-)?application)/(x-png|pjpeg|jpeg|jpg|png|gif)$})
      return false 
    end
  end 

  
end
