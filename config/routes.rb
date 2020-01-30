Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'
  resources :items
post 'authenticate', to: 'authentication#authenticate'
  resources :groups do
    resources :messages
  end
end
