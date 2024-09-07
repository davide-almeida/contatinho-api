# frozen_string_literal: true

class AddressSerializer < ActiveModel::Serializer
  attributes :id, :street, :number, :city, :state, :zip_code, :country, :latitude, :longitude
end
