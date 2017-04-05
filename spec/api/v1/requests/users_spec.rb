require 'rails_helper'

module Api
  module V1
    describe 'Users API', type: :request do
      let(:organization) { create(:organization) }
      let(:valid_attributes) { { user: { name: Faker::HarryPotter.name, email: Faker::Internet.email, password: 'passwordtest', password_confirmation: 'passwordtest', organization_id: organization.id } } }

      describe 'POST /api/v1/users' do
        context 'when the request is valid' do
          before { post '/api/v1/users', params: valid_attributes }
          it 'creates an user' do
            expect(JSON.parse(response.body)['name']).to eq(valid_attributes[:user][:name])
          end

          it 'returns status code 201' do
            expect(response).to have_http_status(201)
          end
        end

        context 'when the request is invalid' do
          before { post '/api/v1/users', params: { user: { name: 'Lorem Ipsum' } } }

          it 'returns a validation failure message' do
            expect(response.body).to include('can\'t be blank')
          end

          it 'returns status code 422' do
            expect(response).to have_http_status(422)
          end
        end
      end
    end
  end
end
