# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Users::RegistrationsController, type: :controller do
  let(:user) { create(:user) }
  let(:user_params) { { email: 'test@example.com', password: 'password123', password_confirmation: 'password123' } }

  def set_devise_mapping
    @request.env['devise.mapping'] = Devise.mappings[:user]
  end

  before do
    set_devise_mapping
  end

  describe 'POST #create' do
    context 'when registration is successful' do
      before do
        post :create, params: { user: user_params }
      end

      it 'returns a success response' do
        expect(response).to have_http_status(:ok)
        json_response = response.parsed_body
        expect(json_response['status']).to eq('success')
        expect(json_response['message']).to eq('Signed up successfully.')
      end
    end

    context 'when registration fails' do
      before do
        # params inválidos
        post :create, params: { user: user_params.except(:password) }
      end

      it 'returns an error response' do
        expect(response).to have_http_status(:unprocessable_entity)
        json_response = response.parsed_body
        expect(json_response['status']).to eq('error')
        expect(json_response['message']).to include("Password can't be blank")
      end
    end
  end
end
