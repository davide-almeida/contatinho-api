# frozen_string_literal: true

class Api::V1::UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    users = UserSerializer.serialize(User.all)

    render json: {
      users: users
    }, status: :ok
  end
end
