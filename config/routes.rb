Rails.application.routes.draw do
  root 'technologies#index'

  resources :technologies do
    resources :histories
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
