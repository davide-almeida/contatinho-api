# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  respond_to :json

  private

  def respond_with(resource, _opts = {})
    if resource.persisted?
      render json: {
        status: 'success',
        data: resource,
        message: 'Signed up successfully.'
      }, status: :ok
    else
      render json: {
        status: 'error',
        message: resource.errors.full_messages.join(' ')
      }, status: :unprocessable_entity
    end
  end
end
