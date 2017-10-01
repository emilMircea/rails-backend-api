# frozen_string_literal: true

module V1
  class Api::V1::ContactsController < ApplicationController
    # before_action :authenticate_user!

    def current_account
      @current_account ||= Account.friendly.find(params[:account_id])
      @current_account
    end

    def current_organization
      @current_organization ||= current_account.organizations.friendly.find(params[:organization_id])
    end

    def index
      @contacts = current_account.contacts
      render json: @contacts, status: :ok
    end

    def create
      @contact = current_organization.contacts.build(contact_params)
      if @contact.save
        render json: @contact, status: :created
      else
        head(:unprocessable_entity)
      end
    end

    def update
      @contact = current_organization.contacts.find(params[:id])
      if @contact.update(contact_params)
        render :update
      else
        head(:unprocessable_entity)
      end
    end

    def destroy
      @contact = current_organization.contacts.where(id: params[:id])
      if @contact.destroy
        head(:ok)
      else
        head(:unprocessable_entity)
      end
    end

    private
      def contact_params
        params.require(:contact).permit(:name, :email)
      end
  end
end
