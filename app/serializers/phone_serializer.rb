# frozen_string_literal: true

class PhoneSerializer
  def self.serialize(phones)
    phones.map { |phone| phone.serializable_hash }
  end
end
