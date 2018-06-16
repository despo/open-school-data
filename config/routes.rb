Rails.application.routes.draw do
  root  'pages#index'
  resources :schools, only: [:show, :index]
end
