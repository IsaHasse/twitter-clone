Rails.application.routes.draw do
  get  'signup', to: 'users#new'
  post 'signup', to: 'users#create'

  root 'timeline#index'
end