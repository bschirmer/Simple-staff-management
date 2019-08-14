Rails.application.routes.draw do
  get 'shift/index'
  get 'shift/create'
  get 'login/index'
  get 'forgot', to: 'login#forgotPassword'
  
  resources :users
  get 'joinOrganisation', to: 'users#joinOrganisation'
  get 'leaveOrganisation', to: 'users#leaveOrganisation'

  resources :organisations

  resources :shifts

  root 'login#index'
end
