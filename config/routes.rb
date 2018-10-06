Rails.application.routes.draw do
  resources :boards, only: [:index, :show]
  get '/boards/:id/details', to: 'boards#details'
  
  resources :cards, only: [:index, :show]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
