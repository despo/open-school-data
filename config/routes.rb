Rails.application.routes.draw do
  resources :schools, only: [:show, :index]
end
