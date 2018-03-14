Rails.application.routes.draw do
  #get 'favorites/index'

  post '/rate' => 'rater#create', :as => 'rate'
  get 'users/show' => 'users#show'
  get 'users/profile/:id' => 'users#profile'
  resources :favorites
  #get 'users/edit' => 'users#edit'
  #patch 'users/update' => 'users#update'
  resources :genres
  resources :playlists
  resources :albums
  resources :posts
  resources :songs
  resources :artists
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  get 'home_page/Index'

  devise_for :users
  root 'home#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
