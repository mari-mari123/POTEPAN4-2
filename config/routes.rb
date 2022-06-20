Rails.application.routes.draw do
  get 'reservations/index'
  post 'reservations/confirm'
  get 'reservations/confirm'
  post 'reservations/show' => 'reservations#create'
  get 'reservations/show'
  root 'homes#index'
  get 'users/account'
  get 'users/profile'
  patch 'users/profile' => 'users#update'
  get 'rooms/posts'
  get 'rooms/search/result' => 'rooms#search'
  resources :rooms
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
