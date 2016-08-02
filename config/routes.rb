Rails.application.routes.draw do
  resources :day_actions
  root 'home#show'

  get 'auth/:provider/callback', to: 'sessions#create'
  get 'auth/failure', to: redirect('/')
  get 'signout', to: 'sessions#destroy', as: 'signout'

  resources :sessions, only: [:create, :destroy]

  resource :home, only: [:show]

  resources :month_actions, only: [:index, :new, :edit, :create, :update, :destroy]

  resources :domains do
    resource :plan, only: [:show, :edit, :update, :destroy]
    resources :deadlines, only: [:index, :new, :edit, :create, :update, :destroy]
  end


end
