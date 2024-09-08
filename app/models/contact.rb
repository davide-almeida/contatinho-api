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

  # Scope para realizar a busca de contact por name ou cpf_code
  scope :search_by_name_or_cpf, ->(query) {
    return none if query.blank?

    where("cpf_code ILIKE :query OR name ILIKE :query", query: "%#{query}%").order(:name)
  }

  private

  # Método para buscar latitude e longitude do endereço e adicionar na instância do contact
  def tracker
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
        errors.add(:base, 'Address not found')
      end
    end
  end
end
