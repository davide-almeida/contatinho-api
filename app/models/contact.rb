# frozen_string_literal: true

class Contact < ApplicationRecord
  belongs_to :user

  validates :name, presence: true
  validates :cpf_code, presence: true, uniqueness: true
  validate :cpf_format_validator

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

  # Método para validar o formato do CPF (seguindo as regras oficiais)
  def cpf_format_validator
    unless CpfValidator.valid?(cpf_code)
      errors.add(:cpf_code, 'format is invalid')
    end
  end
end
