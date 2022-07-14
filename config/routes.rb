Rails.application.routes.draw do
  namespace :admin do
    resources :units
    resources :properties
    get '/', to: 'dashboard#index'
  end
  devise_for :users
  root "pages#index"
end
