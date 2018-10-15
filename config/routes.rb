Rails.application.routes.draw do
  resources :boards, only: [:index, :show]
  get '/boards/:id/details', to: 'boards#details'
  
  resources :cards, only: [:index, :show]
  post 'cards/:id/move', action: :move, controller: :cards
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
