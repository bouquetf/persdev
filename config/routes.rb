Rails.application.routes.draw do
  # welcome page
  root 'home#show'

  get '/home', to: "home#show"

  # Authentication, user and session management
  resources :sessions, only: [:create, :destroy]
  get 'auth/:provider/callback', to: 'sessions#create'
  get 'auth/failure', to: redirect('/')
  get 'signout', to: 'sessions#destroy', as: 'signout'

  get '/today', to: 'day_agendas#today', as: 'today_agenda'
  get '/day_agendas/:id/morning', to: 'day_agendas#morning', as: 'edit_morning_agenda'
  get '/day_agendas/:id/evening', to: 'day_agendas#evening', as: 'edit_evening_agenda'

  # Action
  resources :month_actions, only: [:index, :new, :edit, :create, :update, :destroy]
  resources :day_actions
  resources :day_agendas

  # Plan
  resources :domains do
    resource :plan, only: [:show, :edit, :update, :destroy]
    resources :deadlines, only: [:index, :new, :edit, :create, :update, :destroy]
  end
end
