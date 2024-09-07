# frozen_string_literal: true

class Api::V1::UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user, only: %i[destroy]

  def index
    users = User.all

    render json: users
  end

  def destroy
    if @user.destroy
      render json: {
        message: "User deleted successfully"
      }, status: :ok
    else
      render json: {
        errors: user.errors.full_messages
      }, status: :unprocessable_entity
    end
  end

  private

  def set_user
    if current_user.id == params[:id].to_i
      @user = current_user
    else
      render json: {
        message: "User not found"
      }, status: :not_found
    end
  end

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end
