class DownloadCounter < ActiveRecord::Base

  validates_presence_of :fossil
  
  belongs_to :user
  belongs_to :fossil

end
