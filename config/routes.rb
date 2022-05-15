Rails.application.routes.draw do
  resources :schedules
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :message_boards, only: [:index], as: 'message_boards'

  resources :messages do
    resources :comments
  end

  resources :personals, only: [:index]
  resources :projects, expect: [:index]
  

  resource :users do
    resources :settings, only: [:index] do
      get :account, :appearance, :language, :upgrade
    end
  end

  root 'home#index'
end
