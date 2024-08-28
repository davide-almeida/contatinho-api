class SessionsController < ApplicationController
  before_action :authenticate_user!

  def create
    if authenticate_with_http_basic { |email, password| user = User.find_by(email: email)&.valid_password?(password) }
      render json: { message: "Authenticated successfully" }, status: :ok
    else
      render json: { error: "Invalid credentials" }, status: :unauthorized
    end
  end

  def destroy
    sign_out
    render json: { message: "Logged out successfully" }, status: :ok
  end
end
