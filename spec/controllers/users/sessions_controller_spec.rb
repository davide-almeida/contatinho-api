# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Users::SessionsController, type: :controller do
  let(:user) { create(:user) }
  let(:token) { Warden::JWTAuth::UserEncoder.new.call(user, :user, nil).first }

  before do
    @request.env['devise.mapping'] = Devise.mappings[:user]
  end

  describe 'POST #create' do
    context 'when login is successful' do
      before do
        allow(request.env['warden']).to receive(:authenticate!).and_return(user)
        request.headers['Authorization'] = "Bearer #{token}"
        post :create, params: { user: { email: user.email, password: user.password } }
      end

      it 'returns a success response with token and user data' do
        expect(response).to have_http_status(:ok)
        json_response = response.parsed_body
        expect(json_response['status']).to eq('success')
        expect(json_response['data']['token']).to eq(token)
        expect(json_response['data']['user']['id']).to eq(user.id)
        expect(json_response['data']['user']['email']).to eq(user.email)
      end
    end
  end

  describe 'DELETE #destroy' do
    context 'when logout is successful' do
      before do
        request.headers['Authorization'] = "Bearer #{token}"
        allow(JWT).to receive(:decode).with(token,
                                            Rails.application.credentials.devise_jwt_secret_key!)
                                      .and_return([{ 'sub' => user.id }])
        delete :destroy
      end

      it 'returns a success response' do
        expect(response).to have_http_status(:ok)
        json_response = response.parsed_body
        expect(json_response['status']).to eq('success')
        expect(json_response['message']).to eq('logged out successfully')
      end
    end

    context 'when no active session is found' do
      before do
        request.headers['Authorization'] = 'Bearer invalid_token'
        allow(JWT).to receive(:decode).with('invalid_token',
                                            Rails.application.credentials.devise_jwt_secret_key!)
                                      .and_raise(JWT::DecodeError)
        delete :destroy
      end

      it 'returns an error response' do
        expect(response).to have_http_status(:unauthorized)
        json_response = response.parsed_body
        expect(json_response['status']).to eq('error')
        expect(json_response['message']).to eq("Couldn't find an active session.")
      end
    end
  end
end
