Rails.application.routes.draw do
  devise_for :users
  root 'books#index'
  get '/books' => 'books#new'
  resources :users
  resources :books
  resources :phot_image

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
