Rails.application.routes.draw do

  namespace :api do
    namespace :v1 do
      resources :institutions, except: [:new, :edit]
      resources :symptoms, only: [:index]
    end
  end
  

  root "institutions#index"
  resources :institutions
  resources :symptoms
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
