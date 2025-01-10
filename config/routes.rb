Rails.application.routes.draw do
  devise_for :users

  authenticated :user do
    root 'articles#index', as: :authenticated_root
  end

  devise_scope :user do
    root 'devise/sessions#new', as: :unauthenticated_root
  end

  get '/articles_list', to: 'articles#articles_list', as: 'articles_list', defaults: { format: :turbo_stream }

  resources :articles do
    member do
      get :preview
    end
    resources :likes, only: [:create]
    resources :comments do
      resources :likes, only: [:create]
    end
  end

  resources :comments do
    resources :comments do
      resources :likes, only: [:create]
    end
  end

  get 'up' => 'rails/health#show', as: :rails_health_check
end
