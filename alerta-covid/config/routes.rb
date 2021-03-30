Rails.application.routes.draw do

  resources :departaments
  resources :areas
  namespace :api do
    namespace :v1 do
      resources :institutions, except: [:new, :edit]
      resources :departaments, only: [:show, :index]
    end
  end
  

  root "institutions#index"
  resources :institutions
  resources :departaments
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
