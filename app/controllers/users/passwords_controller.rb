# frozen_string_literal: true

class Users::PasswordsController < Devise::PasswordsController
  respond_to :json

  # POST /password
  def create
    resource = User.find_by(email: params[:user][:email])
    if resource.present?
      resource.send_reset_password_instructions
      render json: { status: 'success', message: 'Reset password instructions sent.' }, status: :ok
    else
      render json: { status: 'error', message: 'Email not found.' }, status: :unprocessable_entity
    end
  end

  # PUT /password
  def update
    resource = User.reset_password_by_token(reset_password_params)
    if resource.errors.empty?
      render json: { status: 'success', message: 'Password changed successfully.' }, status: :ok
    else
      render json: { status: 'error', message: resource.errors.full_messages.join(', ') }, status: :unprocessable_entity
    end
  end

  private

  def reset_password_params
    params.require(:user).permit(:reset_password_token, :password, :password_confirmation)
  end
end
