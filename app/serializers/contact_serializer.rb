# frozen_string_literal: true

class ContactSerializer < ActiveModel::Serializer
  attributes :id, :name, :cpf_code

  has_many :phones
  has_one :address
end
