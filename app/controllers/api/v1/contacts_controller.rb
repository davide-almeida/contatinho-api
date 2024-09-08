# frozen_string_literal: true

class Api::V1::ContactsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_contact, only: %i[update destroy]

  def index
    contacts = current_user.contacts

    render json: contacts, status: :ok
  end

  def create
    contact = current_user.contacts.build(contact_params)

    if contact.save
      render json: contact, status: :created
    else
      render json: {
        errors: contact.errors.full_messages
      }, status: :unprocessable_entity
    end
  end

  def update
    if @contact.update(contact_params)
      render json: @contact, status: :ok
    else
      render json: {
        errors: contact.errors.full_messages
      }, status: :unprocessable_entity
    end
  end

  def destroy
    if @contact.destroy
      render json: {
        message: "Contact deleted successfully"
      }, status: :ok
    else
      render json: {
        errors: contact.errors.full_messages
      }, status: :unprocessable_entity
    end
  end

  private

  def set_contact
    if current_user.contacts.exists?(params[:id])
      @contact = current_user.contacts.find(params[:id])
    else
      render json: {
        message: "Contact not found"
      }, status: :not_found
    end
  end

  def contact_params
    params.require(:contact).permit(
      :name, :cpf_code,
      phones_attributes: %i[number],
      address_attributes: %i[street number neighborhood city state zip_code country latitude longitude]
    )
  end
end
