# frozen_string_literal: true

Rails.application.routes.draw do
  match '/404', to: 'application#not_found', via: :all

  resources :todo_lists do
    resources :todo_items
  end

  namespace :todo_list do
    resources :todo_items
  end
  
  devise_for :users , controllers: { omniauth_callbacks: "users/omniauth_callbacks" }

  devise_scope :user  do
    get 'users/info' , to:'users/infos#info'
    post 'users/info' , to:'users/infos#setting'
  end 

  resources :schedules
  resources :messages do
    resources :comments, module: :messages
  end

  resources :buckets do
    resources :comments, module: :buckets
    collection do
      get 'document'
      get 'upload'
    end
  end
  root 'home#index'

  resources :chat_rooms, only: [:show]
  resource :contents, only: [:create]

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
  resources :projects, expect: [:index]
end
