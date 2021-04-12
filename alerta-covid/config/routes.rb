Rails.application.routes.draw do

  namespace :api do
    namespace :v1 do
      resources :institutions, only: [:index]
      resources :covid_tests, only: [:index]
      resources :symptoms, only: [:index]
      resources :areas, only: [:index]
      resources :departaments, only: [:index]
    end
  end
  
  
  root "institutions#index"
  resources :covid_tests
  resources :institutions
  resources :symptoms
  resources :areas
  resources :departaments
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
