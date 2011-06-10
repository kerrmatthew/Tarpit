class Fossil < ActiveRecord::Base

  validates_presence_of :collection, :name, :upload_user_id
  validates_attachment_presence :attachment
  
#   validates_each :upload_user_id do |record, attr, value|
#     record.errors.add(attr, "#{value.name} is not allowed to upload to the collection: #{record.collection.name}") unless value.can_upload_collections.include?(record.collection)
#   end
  
 # validates_attachment_presence :attachment
  
  belongs_to :upload_user, :class_name => 'User', :foreign_key => :upload_user_id
  
  belongs_to :collection
  has_many :download_counters, :dependent => :destroy
  
  has_attached_file :attachment,
                    :url => "/collections/:collection_id/files/:id/download",
                    :path => ':rails_root/assets/:class/:id/:style/:filename'

  
end
