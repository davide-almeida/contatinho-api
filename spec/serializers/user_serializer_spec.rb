# frozen_string_literal: true

require 'rails_helper'

RSpec.describe UserSerializer do
  it 'serializes the user with the expected attributes' do
    user = create(:user)
    subject = described_class.new(user).serializable_hash

    expect(subject).to match(
      {
        data: {
          id: user.id.to_s,
          type: :user,
          attributes: {
            id: user.id,
            email: user.email
          }
        }
      }
    )
  end
end
