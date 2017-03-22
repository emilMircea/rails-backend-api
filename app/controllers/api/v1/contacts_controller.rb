class Api::V1::ContactsController < ApplicationController
  def index
    # byebug
    @contacts = Contact.all
    render json: @contacts, status: :ok
  end

  def create
    @contact = Contact.new(contact_params)
    @contact.save
    render json: @contact, status: :created
  end

  def destroy
    @contact = Contact.find(params[:id])
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
