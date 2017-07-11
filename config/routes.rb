# frozen_string_literal: true

Rails.application.routes.draw do
  # root to: 'api/v1/contacts'

  devise_for :users

  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :accounts, only: [:create, :update] do
        resources :contacts
      end
      resource :sessions, only: [:create, :destroy, :show]
      resources :users, only: [:create]
    end
  end
end
