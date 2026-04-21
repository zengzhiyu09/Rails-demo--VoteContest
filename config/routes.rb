Rails.application.routes.draw do
  

  devise_for :users
  
  get 'home/index'
  resources :votes
  post 'candidates/:candidate_id/vote', to: 'votes#create', as: 'vote_candidate'

  root to: "home#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
