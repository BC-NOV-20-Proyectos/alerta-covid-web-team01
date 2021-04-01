Rails.application.routes.draw do

  resources :departaments
  resources :areas
  namespace :api do
    namespace :v1 do
      resources :institutions, except: [:new, :edit]
<<<<<<< HEAD
      resources :departaments, only: [:show, :index]
=======
      resources :areas, only: [:show, :index]
>>>>>>> 526b3826aea051503f9306d3eb94acae37f92b8d
    end
  end
  

  root "institutions#index"
  resources :institutions
<<<<<<< HEAD
  resources :departaments
=======
  resources :areas
>>>>>>> 526b3826aea051503f9306d3eb94acae37f92b8d
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
