Rails.application.routes.draw do

  resources :roles
  devise_for :users, controllers: { sessions: "users/sessions",
    registrations: 'users/registrations',
    passwords: "users/passwords",
    confirmations: "users/confirmations" }
    namespace :api do
      namespace :v1 do
        resources :institutions, only: [:index]
        resources :covid_tests, only: [:index]
        resources :symptoms, only: [:index]
        resources :areas, only: [:index]
        resources :places, only: [:index]
        resources :departaments, only: [:index]
        resources :incidences, only: [:index, :create, :update]
      end
    end
    
    
    root "institutions#index"
    resources :covid_tests
    resources :institutions
    resources :symptoms
    resources :areas
    resources :places
    resources :departaments
    resources :incidences, except: [:destroy]
    
  scope :admin do
    resources :users
  end
  # Ex:- scope :active, -> {where(:active => true)}
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
