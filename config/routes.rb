Talks::Application.routes.draw do
  devise_for :users, :controllers => {:sessions => "sessions"}

  resources :talks
  resources :users, :only => [:show, :edit]

  match 'contact' => 'pages#contact'
  root :to => 'pages#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
