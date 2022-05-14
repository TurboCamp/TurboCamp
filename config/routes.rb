Rails.application.routes.draw do
  resources :todo_lists do
    resources :todo_items
  end
  namespace :todo_list do
    resources :todo_items
  end
  resources :schedules
  devise_for :users , controllers: { omniauth_callbacks: "users/omniauth_callbacks" }

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  # resources :message_boards, only: [:index], as: "message_boards"

  get 'message_borads', to: 'message_boards#index'

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

  root "home#index"
  resources :personals ,only: [:index]
  resources :projects , expect:[:index]  

end
