class Api::V1::ContactsController < ApplicationController
  def index
    @contacts = Contacts.all
    render json: @contacts, status: :ok
  end
end
