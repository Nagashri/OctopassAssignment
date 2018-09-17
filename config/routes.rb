Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'tickets#index'
  resources :tickets , only: [:index,:show]
  post 'create_ticket' => 'api#create_ticket', as: :create_ticket
end
