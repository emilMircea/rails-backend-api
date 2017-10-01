# frozen_string_literal: true

Rails.application.routes.draw do
  # root to: 'api/v1/contacts'

  devise_for :users

  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      #  account_id neeeds to be passed with each request
      scope ':account_id' do
        # browse all contacts under an account
        resources :contacts, only: [:index]
        # browse all contacts under an organization
        resources :organizations, only: [:create, :update] do
          resources :contacts, only: [:create, :update, :destroy]
        end
      end

      resources :accounts, only: [:create, :update]

      resource :sessions, only: [:create, :destroy, :show]
      resources :users, only: [:create]
    end
  end
end
