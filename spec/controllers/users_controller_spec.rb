# frozen_string_literal: true

require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  let(:user) { create(:user) }
  let(:other_user) { create(:user, email: 'email_do_bom@example.com') }
  let(:token) { Warden::JWTAuth::UserEncoder.new.call(user, :user, nil).first }

  describe 'GET #index' do
    context 'when user is authenticated' do
      before do
        create(:user, email: 'user1@example.com')
        create(:user, email: 'user2@example.com')
        sign_in(user)
        request.headers['Authorization'] = "Bearer #{token}"
        get :index
      end

      it 'returns a success response' do
        expect(response).to have_http_status(:ok)
      end

      it 'returns a list of users' do
        json_response = response.parsed_body
        expect(json_response['status']).to eq('success')
        expect(json_response['message']).to eq('Users fetched successfully.')
        expect(json_response['data']['users']).to be_an(Array)
        expect(json_response['data']['users'].size).to be > 0
      end
    end

    context 'when user is not authenticated' do
      before do
        request.headers['Authorization'] = nil
        get :index
      end

      it 'returns an unauthorized response' do
        expect(response).to have_http_status(:unauthorized)
        json_response = response.body
        expect(json_response).to include('You need to sign in or sign up before continuing.')
      end
    end
  end
end
