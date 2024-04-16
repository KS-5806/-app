Rails.application.routes.draw do
  root "static_pages#top"
  resources :users, only: %i[new create]
  resources :boards, shallow: true do
    resources :comments, only: %i[create destroy]
    collection do
      get :bookmarks
    end
  end
  resources :bookmarks, only: %i[create destroy]
  resource :profile, only: %i[show edit update]
  resources :password_resets, only: %i[new create edit update]

  get 'login', to: 'user_sessions#new'
  post 'login', to: 'user_sessions#create'
  delete 'logout', to: 'user_sessions#destroy'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  namespace :admin do
    root 'dashboards#index'
    resource :dashboard, only: %i[index]
    get 'login' => 'user_sessions#new', :as => :login
    post 'login' => 'user_sessions#create'
    delete 'logout' => 'user_sessions#destroy', :as => :logout
    resources :users, only: %i[index show edit update destroy]
    resources :boards, only: %i[index show edit update destroy]
  end
end
