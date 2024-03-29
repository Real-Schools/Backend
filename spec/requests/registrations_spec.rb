require 'rails_helper'

RSpec.describe 'POST /signup', type: :request do
  let(:url) { '/signup' }
  let(:params) do
    {
      user: {
        email: 'user@example.com',
        password: 'password'
      }
    }
  end

  context 'when user is unauthenticated' do
    before { post url, params: params.to_json,
              headers: { 'CONTENT_TYPE' => 'application/json', 'ACCEPT' => 'application/json' } }

    it 'returns 200' do
      expect(response.status).to eq 200
    end

    it 'returns a new user' do
      expect(response).to have_http_status :created
      # expect(response.body).to match_response_schema('user')
    end
  end

  context 'when user already exists' do
    before do
      FactoryBot.create :user, email: params[:user][:email]
      post url, params: params
    end

    it 'returns bad request status' do
      expect(response.status).to eq 400
    end

    it 'returns validation errors' do
      expect(response_body_if_short['errors'].first['title']).to eq('Bad Request')
    end
  end
end
