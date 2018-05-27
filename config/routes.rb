Rails.application.routes.draw do
  devise_for :users
  root'books#top'
  get '/books' => 'books#index'
 

  resources :users
  resources :books
  resources :phot_image

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
