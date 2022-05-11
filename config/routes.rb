Rails.application.routes.draw do
 

  devise_for :users , controllers: { 
    omniauth_callbacks: "users/omniauth_callbacks" } 

  devise_scope :user  do 
    get "sign_up/:token" , to:'users/registrations#new_user_with_letter', as:'sign_up_with_letter'
  end
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :message_boards, only: [:index], as: "message_boards"
  resources :schedules
  
  resources :messages do
    resources :comments
  end
  
  root "home#index"
  resources :personals ,only: [:index]
  resources :projects , except:[:index] do 
    resources :invitations, only: [:new, :create]
  end

  resources :chat_rooms , only:[:show ]
  resources :contents , only:[:create]
  

end
