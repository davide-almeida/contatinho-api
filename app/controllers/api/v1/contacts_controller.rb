# frozen_string_literal: true

class Api::V1::ContactsController < ApplicationController
  before_action :authenticate_user!

  def index
    contacts = ContactSerializer.serialize(current_user.contacts)

    render json: {
      contacts: contacts
    }, status: :ok
  end
end
