Rails.application.routes.draw do
  root "items#index"
  resources :items do
    get :parse
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
