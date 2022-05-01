Rails.application.routes.draw do
  devise_for :users , controllers: { omniauth_callbacks: "users/omniauth_callbacks" }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :message_boards, only: [:index], as: "message_boards"
  resources :messages
  
  root "home#index"
end
