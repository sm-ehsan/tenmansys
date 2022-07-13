Rails.application.routes.draw do
  namespace :admin do
    resources :properties
    get '/', to: 'dashboard#index'
  end
  devise_for :users
  root "pages#index"
end
