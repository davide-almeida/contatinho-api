# frozen_string_literal: true

class Address < ApplicationRecord
  belongs_to :contact

  validates :street, presence: true
  validates :number, presence: true
  validates :city, presence: true
  validates :state, presence: true
  validates :zip_code, presence: true
  validates :country, presence: true
  validates :latitude, presence: true
  validates :longitude, presence: true

  private

  def attribute_names_for_serialization
    ['id', 'street', 'number', 'city', 'state', 'zip_code', 'country', 'latitude', 'longitude']
  end
end
