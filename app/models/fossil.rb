class Fossil < ActiveRecord::Base

  validates_presence_of :collection
  
  belongs_to :collection
  
  has_attached_file :attachment
  
end
