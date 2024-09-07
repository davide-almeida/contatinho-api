# frozen_string_literal: true

class Contact < ApplicationRecord
  belongs_to :user

  validates :name, presence: true
  validates :cpf_code, presence: true, uniqueness: true

  has_many :phones, dependent: :destroy
  has_one :address, dependent: :destroy

  accepts_nested_attributes_for :phones, allow_destroy: true
  accepts_nested_attributes_for :address, allow_destroy: true

  private

  def attribute_names_for_serialization
    ['id', 'name', 'cpf_code']
  end
end
