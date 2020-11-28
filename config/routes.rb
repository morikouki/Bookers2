Rails.application.routes.draw do

  root 'homes#top'
  get 'home/about' => 'homes#about'
  
  devise_for :users
  resources :users do
  	resources :relationships, only: [:create, :destroy]
  	get 'follower' => 'relationships#follower'
  	get 'followed' => 'relationships#followed'
  end
  resources :books do
    resource :favorite, only: [:create, :destroy]
  end


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
