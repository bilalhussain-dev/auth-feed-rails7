Rails.application.routes.draw do
  devise_for :users
  # get 'pages/index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "pages#index"
  resources :posts do
    resources :comments, only: [:create]
    resources :likes, only: [:create]
    delete 'likes', to: 'likes#destroy', as: 'unlike'
  end

end
