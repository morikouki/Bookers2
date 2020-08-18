Rails.application.routes.draw do

  root 'homes#top'
  get 'home/about' => 'homes#about'
  
  devise_for :users
  resources :users do
  	resource :relationships, only: [:create, :destroy]
    get 'follows' => 'relationships#follower', as: 'follows'
    get 'followers' => 'relationships#followed', as: 'followers'
  end
  resources :books


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
