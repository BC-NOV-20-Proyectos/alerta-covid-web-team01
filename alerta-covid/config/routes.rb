Rails.application.routes.draw do

  resources :departaments
  resources :areas
  namespace :api do
    namespace :v1 do
      resources :institutions, except: [:new, :edit]
    end
  end
  

  root "institutions#index"
  resources :institutions
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
