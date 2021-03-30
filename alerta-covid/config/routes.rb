Rails.application.routes.draw do

  namespace :api do
    namespace :v1 do
      resources :institutions, except: [:new, :edit]
      resources :covid_tests, only: [:index]
    end
  end
  
  
  root "institutions#index"
  resources :covid_tests
  resources :institutions
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
