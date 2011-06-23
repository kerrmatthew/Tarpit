class CollectionUserJoin < ActiveRecord::Base

  belongs_to :collection
  belongs_to :user

  scope :can_upload, where(:can_upload => true)


end
