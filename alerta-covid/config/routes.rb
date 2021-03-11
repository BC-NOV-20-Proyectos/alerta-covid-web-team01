Rails.application.routes.draw do
  root "institutions#index"
  resources :institutions
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
