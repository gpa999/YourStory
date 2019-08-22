Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'stories#index' #ルートパス
  resources :stories
  resources :users,only: [:index, :show, :edit, :update]
  resources :users do 
    resources :comments, only: [:create]
  end
  resources :relationships, only: [:create, :destroy]
end
