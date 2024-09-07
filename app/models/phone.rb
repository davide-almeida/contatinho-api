# frozen_string_literal: true

class Phone < ApplicationRecord
  belongs_to :contact

  validates :number, presence: true

  private

  def attribute_names_for_serialization
    ['id', 'number']
  end
end
