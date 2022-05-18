# frozen_string_literal: true

Rails.application.routes.draw do
  match '/404', to: 'application#not_found', via: :all
  
  devise_for :users , controllers: { omniauth_callbacks: "users/omniauth_callbacks" }

  devise_scope :user  do
    get 'users/info' , to:'users/infos#info'
    post 'users/info' , to:'users/infos#setting'
  end 

  root 'home#index'

  namespace :api do
    namespace :v1 do
      resources :projects, only: [] do
        member do
          post :search
        end
      end
    end
  end

  resources :personals, only: [:index]

  resources :projects, except: [:index] do 
    resources :buckets do
      resources :comments, module: :buckets
      collection do
        get 'document'
        get 'upload'
      end
    end
    resource :chat_room , only: [:show] do 
      resources :contents, only: [:create]
    end
    
    resources :schedules
    resources :messages do
      resources :comments, module: :messages
    end
    
    resources :todo_lists do
      resources :todo_items
    end
  end

  
end
