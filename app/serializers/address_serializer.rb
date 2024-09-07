# frozen_string_literal: true

class AddressSerializer
  # include JSONAPI::Serializer
  # attributes :id, :street, :number, :city, :state, :zip_code, :country, :latitude, :longitude

  def self.serialize(addresses)
    addresses.map { |address| address.serializable_hash }
  end
end
