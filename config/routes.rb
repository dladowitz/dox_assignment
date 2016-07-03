Rails.application.routes.draw do
  root 'articles#index'

  resources :pages, only: [:index, :show]
  resources :articles, only: [:index, :show]
  resources :authors, only: [:index]

  get 'components' => 'components#components', as: :components
  get 'admin' => 'administrator/articles#index', as: :admin
  post 'search' => 'articles#search', as: :search
  
  namespace :administrator do
    resources :authors
    resources :articles, except: :show
    resources :pages, except: :show
  end
end
