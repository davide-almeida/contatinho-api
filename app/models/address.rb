# frozen_string_literal: true

class Address < ApplicationRecord
  belongs_to :contact

  validates :street, :number, :neighborhood, :city, :state, :zip_code, :country, presence: true
  validates :latitude, :longitude, presence: true, if: :coordinates_required?

  before_validation :fetch_coordinates

  private

  # Método para buscar latitude e longitude do endereço
  def fetch_coordinates
    return unless street.present? && city.present? && state.present?

    # Monta o endereço completo como string
    full_address = [street, number, neighborhood, city, state, country].compact.join(', ')

    # Chama o service GoogleMapsClient
    googlemaps = GoogleMapsClient.new(full_address)
    location = googlemaps.call

    # Popula latitude e longitude com o resultado da consulta
    if location['status'] == 'OK' && location['results'].any?
      coordinates = location['results'].first['geometry']['location']
      self.latitude = coordinates['lat']
      self.longitude = coordinates['lng']
    else
      errors.add(:base, 'Address not found')
    end
  end

  # Verifica se as coordenadas estão preenchidas
  def coordinates_required?
    latitude.blank? || longitude.blank?
  end
end
