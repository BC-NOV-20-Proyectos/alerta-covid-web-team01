Rails.application.routes.draw do

  devise_for :users, controllers: { sessions: 'users/sessions',
                                    registrations: 'users/registrations',
                                    passwords: 'users/passwords',
                                    confirmations: 'users/confirmations' }
  namespace :api do
    namespace :v1 do
      resources :areas, only: [:index]
      resources :covid_tests, only: [:index]
      resources :departaments, only: [:index]
      resources :incidences, only: [:index, :create, :update]
      resources :institutions, only: [:index]
      resources :places, only: [:index]
      resources :symptoms, only: [:index]   
      
      # User confirmation by API
      get 'confirm_user', to: 'confirmations#confirm_user'
      # User Edition by API
      patch :user, to: 'users#update'
      patch 'user_update_password', to: 'users#update_password'
      #User login by API
      post 'login', to: 'sessions#create'
      get '/auto_login', to: 'sessions#auto_login'

      get 'reports/places'
      get 'reports/users'
    end
  end
  
  resources :areas
  resources :covid_tests
  resources :departaments
  resources :incidences, except: [:destroy]
  resources :institutions
  resources :places
  resources :roles
  resources :symptoms  

  scope :admin do
    resources :users
  end
  
  root 'home#home'
  get 'home/home'
  get 'home/comfirmation'
  get 'reports/places'
  get 'reports/users'
  # Ex:- scope :active, -> {where(:active => true)}
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
