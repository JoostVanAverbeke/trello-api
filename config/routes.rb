Rails.application.routes.draw do
  resources :employees, only: [:index]
  resources :dashboards, only: [:index]
  get 'dashboards/:id/details', to: 'dashboards#details'
  resources :teams, only: [:index, :show] do
    resources :boards, only: [:index]
  end
  resources :boards, only: [:index, :show]
  get '/boards/:id/details', to: 'boards#details'
  
  resources :cards, only: [:index, :show]
  post 'cards/:id/move', action: :move, controller: :cards
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
