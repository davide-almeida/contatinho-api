# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  respond_to :json

  private

  def respond_with(resource, _opts = {})
    if resource.persisted?
      render json: resource, status: :created
    else
      render json: {
        status: 'error',
        message: resource.errors.full_messages.join(' ')
      }, status: :unprocessable_entity
    end
  end
end
