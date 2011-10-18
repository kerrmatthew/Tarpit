Tarpit::Application.routes.draw do
  
  resources :collections do 
    resources :files, :as => :fossils, :controller => 'fossils'
  end
  match 'files/:id/download/(:style)' => 'fossils#download', :as => :download, :via => :get
  
  resources :files, :as => :fossils, :controller => 'fossils', :only => [:show, :index]
  
#   match 'fossils/:id/:style', :controller => 'fossils', :action => 'download', :conditions => { :method => :get }

  
  devise_for :users
  
  resources :people, :as => :users, :controller => 'users'


  root :to => "collections#index"

end
