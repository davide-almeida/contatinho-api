# frozen_string_literal: true

class Contact < ApplicationRecord
  belongs_to :user
  before_validation :tracker

  validates :name, presence: true
  validates :cpf_code, presence: true, uniqueness: true

  has_many :phones, dependent: :destroy
  has_one :address, dependent: :destroy

  accepts_nested_attributes_for :phones, allow_destroy: true
  accepts_nested_attributes_for :address, allow_destroy: true

  private

  def tracker
    lookup_cep
    geosearch
  end

  def lookup_cep
    zip_code = self.address[:zip_code]
    return if zip_code.blank?

    # Chama o service ViaCepClient
    via_cep_client = ViaCepClient.new(zip_code)
    address_info = via_cep_client.get_address

    if address_info['erro']
      errors.add(:zip_code, 'CEP inválido')
    else
      # Popula os atributos com base no resultado da consulta
      self.address.street = address_info['logradouro']
      self.address.neighborhood = address_info['bairro']
      self.address.city = address_info['localidade']
      self.address.state = address_info['estado']
      self.address.country = 'Brasil'
    end
  end

  def geosearch
    unless address.latitude.present? && address.longitude.present?
      # Monta o endereço completo como string
      full_address = [
        self.address.street,
        self.address.number,
        self.address.neighborhood,
        self.address.city,
        self.address.state,
        self.address.country
      ].compact.join(', ')

      # Chama o service GoogleMapsClient
      googlemaps = GoogleMapsClient.new(full_address)
      location = googlemaps.call

      # Popula latitude e longitude com o resultado da consulta
      if location['status'] == 'OK' && location['results'].any?
        coordinates = location['results'].first['geometry']['location']
        self.address.latitude = coordinates['lat']
        self.address.longitude = coordinates['lng']
      else
        errors.add(:base, 'Localização inválida ou não encontrada')
      end
    end
  end
end
