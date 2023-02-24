Rails.application.routes.draw do
  devise_for :users, controllers: { sessions: 'users/sessions' }
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  resources :books do
    resources :comments, except: %i[new show]
  end

  resources :users, only: %i[index show]
    
  root 'pages#index'

  get '/about', to: 'pages#about'
  
  get '/contact', to: 'pages#contact'
   
end
