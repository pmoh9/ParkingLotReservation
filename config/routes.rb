Rails.application.routes.draw do
  root "sessions#new"

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete '/logout' => 'sessions#destroy'

  resources :users, :only => [:new, :create] do
    resources :vehicles, :only => [:index, :new, :create, :destroy] do
      resources :slots, :only =>[:index, :create]
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
