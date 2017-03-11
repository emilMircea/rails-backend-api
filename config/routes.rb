Rails.application.routes.draw do

  root to: 'api/v1/contacts#index'
  # resources :contacts

  devise_for :users

  namespace :api, defaults: {format: 'json'} do
    namespace :v1 do
      resources :contacts
      resource :sessions, only: [:create, :destroy]
    end
  end

end
