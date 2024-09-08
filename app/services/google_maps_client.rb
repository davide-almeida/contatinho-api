# frozen_string_literal: true

class GoogleMapsClient
  API_KEY = Rails.application.credentials[:google_maps_key].freeze
  private_constant :API_KEY

  def initialize(address)
    @address = address
  end

  def call
    response = connection.get("/maps/api/geocode/json?address=#{URI.encode_www_form_component(@address)}&key=#{API_KEY}")
    JSON.parse(response.body)
  end

  private

  def connection
    Faraday.new(url: 'https://maps.googleapis.com')
  end
end
