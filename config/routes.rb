Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  resources :books do
    resources :comments, except: %i[new show]
  end
    
  root 'pages#index'

  get '/about', to: 'pages#about'
  
  get '/contact', to: 'pages#contact'
   
end
