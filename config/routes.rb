Rails.application.routes.draw do
  namespace :admin do
    get 'dashboard/index'
  end
  root "sessions#new"

  namespace :admin do
    get '', to: 'dashboard#index', as: '/'
  end
  
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete '/logout' => 'sessions#destroy'

  resources :users, :only => [:new, :create] do
    resources :vehicles, :only => [:index, :new, :create, :destroy] do
      resources :transactions, :only =>[:index, :create]
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
