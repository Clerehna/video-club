Rails.application.routes.draw do
  get 'movies/show'

  resources :directors do
    resources :movies, only: [:show] do
      get :movie
    end
  end
  # get 'directors', to: 'directors#index'
  # get 'directors', to: 'directors#new'
  # get 'directors/:id', to: 'directors#show', as: 'director'
  # post 'directors/new', to: 'directors#create'
  # get 'directors/:id', to: 'directors#edit'
  # patch 'directors/:id/edit', to: 'directors#update'
  # delete 'directors/:id', to: 'directors#destroy'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
