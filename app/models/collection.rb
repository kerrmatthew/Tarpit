class Collection < ActiveRecord::Base

  has_many :fossils
  
  #has_and_belongs_to_many :users
  has_many :collection_user_joins
  has_many :users, :through => :collection_user_joins
  
  accepts_nested_attributes_for :collection_user_joins, :allow_destroy => true

  def can_upload?(user)
  
    return true if self.collection_user_joins.can_upload.map(&:user).include? user
    false
  end


  def set_upload_permissions(user_array)
    user_array.map!{|u| u.to_i }
  
    collection_user_joins.map do |cuj| 
      if user_array.include?(cuj.user_id)
        cuj.can_upload=true
        cuj.save
      else
        cuj.can_upload=false 
        cuj.save
      end
    end
  end

end
