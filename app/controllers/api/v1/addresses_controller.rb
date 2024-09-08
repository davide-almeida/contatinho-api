# frozen_string_literal: true

class Api::V1::AddressesController < ApplicationController
  before_action :authenticate_user!

  def search_by_cep
    via_cep_client = ViaCepClient.new(cep: params[:cep])
    address_info = via_cep_client.get_address_by_cep

    if address_info['erro']
      render json: { error: 'CEP not found' }, status: :not_found
    else
      render json: address_info, status: :ok
    end
  end

  def search_by_address
    via_cep_client = ViaCepClient.new(
      state: params[:state],
      city: params[:city],
      street: params[:street]
    )
    addresses = via_cep_client.get_addresses

    if addresses.empty?
      render json: { message: 'No addresses found' }, status: :not_found
    else
      render json: addresses, status: :ok
    end
  end

  private

  def address_params
    params.permit(:cep, :state, :city, :street)
  end
end
