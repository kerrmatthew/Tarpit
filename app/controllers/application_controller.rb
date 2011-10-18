class ApplicationController < ActionController::Base
  protect_from_forgery
  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_url, :alert => exception.message
  end
  
  before_filter :set_collections

  def set_collections
    @collections = Collection.accessible_by(current_ability)
  end


end
