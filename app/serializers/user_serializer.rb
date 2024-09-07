# frozen_string_literal: true

class UserSerializer
  def self.serialize(users)
    users.map { |user| user.serializable_hash() }
  end
end
