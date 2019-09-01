Rails.application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'stories#index' #ルートパス
  resources :stories do 
    collection do
      get 'search'
    end
  end
  resources :users,only: [:index, :show, :edit, :update] do 
    collection do
      get 'search'
    end
  end
  resources :users do 
    resources :comments, only: [:create]
  end
  resources :users do 
    resources :relationships, only: [:create, :update]
  end
  resources :stories do
    resources :posts
  end
  resources :images, only: [:create, :destroy]
end
