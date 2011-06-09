class Collection < ActiveRecord::Base

  has_many :fossils
  
  #has_and_belongs_to_many :users
  has_many :collection_user_joins
  has_many :users, :through => :collection_user_joins

end
