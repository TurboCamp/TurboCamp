# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  devise_scope :user  do
    get 'users/info', to: 'users/infos#info'
    post 'users/info', to: 'users/infos#setting'
  end

  root 'home#index'

  namespace :api do
    namespace :v1 do
      resources :projects, only: [] do
        member do
          post :invite_member
        end
      end
    end
  end

  resource :personal, only: [:show]

  resources :projects, except: [:index] do
    resource :bucket, only: [:show] do
      resources :documents, only: %i[create destroy]
    end
    resource :chat_room, only: [:show] do
      resources :contents, only: [:create]
    end

    resources :schedules
    resources :messages do
      resources :comments , only: %i[create destroy edit]
    end

    resources :todo_lists do
      member do
        patch :move
      end
      resources :todo_items
    end
  end

  mount DocumentUploader.download_endpoint => '/documents', host: 'https://turbocamp.tw'
  mount ImageUploader.download_endpoint => '/images', host: 'https://turbocamp.tw'
end
