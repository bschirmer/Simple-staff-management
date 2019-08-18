Rails.application.routes.draw do
  get 'sessions/new'
  get 'sessions/create'
  get 'sessions/destroy'

  get 'page/index'

  resources :sessions, only: [:new, :create, :destroy]  
  get 'signup', to: 'users#new', as: 'signup'  
  get 'login', to: 'sessions#new', as: 'login'  
  get 'logout', to: 'sessions#destroy', as: 'logout'  
  get 'forgot', to: 'login#forgotPassword'

  resources :users
  get 'joinOrganisation', to: 'users#joinOrganisation'
  get 'leaveOrganisation', to: 'users#leaveOrganisation'

  resources :organisations

  resources :shifts
  get 'shift/index'
  get 'shift/create'

  root 'page#index'  
end
