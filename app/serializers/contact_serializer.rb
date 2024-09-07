# frozen_string_literal: true

class ContactSerializer
  def self.serialize(contacts)
    contacts.map { |contact| contact.serializable_hash(include: [:phones, :address]) }
  end
end
