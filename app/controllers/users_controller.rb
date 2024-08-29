# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    @users = User.all
    serialized_users = UserSerializer.new(@users).serializable_hash[:data]
    render json: {
      status: 'success',
      data: {
        users: serialized_users.pluck(:attributes)
      },
      message: 'Users fetched successfully.'
    }, status: :ok
  end
end
