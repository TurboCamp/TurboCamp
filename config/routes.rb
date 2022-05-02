Rails.application.routes.draw do
  resources :schedules
  devise_for :users , controllers: { omniauth_callbacks: "users/omniauth_callbacks" }
  root "home#index"
end
