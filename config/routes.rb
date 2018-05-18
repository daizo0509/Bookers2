Rails.application.routes.draw do
  devise_for :users
  get '/books' => 'books#new'
  root 'books#index'
  resources :books
  

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
