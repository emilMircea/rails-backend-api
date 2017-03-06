class Api::V1::SessionsController < ApplicationController
  # before_action :authenticate_user!
  def create
    user = User.where(email: params[:email]).first

    if user and user.valid_password?(params[:password])
      render json: user.as_json(only: [:email, :authentication_token]), status: :created
    else
      head(:unauthorized)
    end

  end



  def destroy
    #code
  end


end
