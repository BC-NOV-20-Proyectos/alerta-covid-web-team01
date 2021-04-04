Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :institutions, except: [:new, :edit]
      resources :departaments, only: [:show, :index]
      resources :areas, only: [:show, :index]
      resources :covid_tests, only: [:index]
      resources :symptoms, only: [:index]
    end
  end
  
  
  root "institutions#index"
  resources :covid_tests
  resources :institutions
  resources :departaments
  resources :areas
  resources :symptoms
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
