Rails.application.routes.draw do
  resources :items
post 'authenticate', to: 'authentication#authenticate'
  resources :groups do
    resources :messages
  end
end
