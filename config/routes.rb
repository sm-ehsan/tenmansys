Rails.application.routes.draw do
  namespace :admin do
    get '/', to: 'dashboard#index'
  end
  devise_for :users
  root "pages#index"
end
