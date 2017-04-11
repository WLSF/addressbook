require 'rails_helper'

module Api
  module V1
    describe 'Organizations API', type: :request do
      let!(:organizations) { create_list(:organization, 10) }
      let(:organization_id) { organizations.first.id }

      let(:valid_attributes) { { organization: { name: Faker::Company.name } } }
      let(:authorization) { { 'HTTP-AUTHORIZATION' => 'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJleHAiOjE0OTE0NDc4NjgsInN1YiI6Mn0.-fRYcM-0Z2DVSLpPhG8BizXr7YhaUTyzCGRIYmMqKnE' } }

      describe 'GET /api/v1/organizations' do
        before { get '/api/v1/organizations' }

        context 'when the user isn\'t authorizated' do
          it 'returns an empty body' do
            expect(response.body).to be_empty
          end

          it 'returns status code 401' do
            expect(response).to have_http_status(401)
          end
        end
      end

      describe 'POST /api/v1/organizations' do
        context 'when the user isn\'t authorized' do
          before { post '/api/v1/organizations', params: valid_attributes}

          it 'returns an empty body' do
            expect(response.body).to be_empty
          end

          it 'returns status code 401' do
            expect(response).to have_http_status(401)
          end
        end

        context 'when the user is authorized' do
          before { post '/api/v1/organizations', params: valid_attributes, headers: authorization}

          it 'creates an organization' do
            expect(JSON.parse(response.body)['name']).to eq(valid_attributes[:organization][:name])
          end

          it 'returns status code 201' do
            expect(response).to have_http_status(201)
          end
        end
      end

      describe 'PUT /api/v1/organizations/:id' do
        before { put "/api/v1/organizations/#{organization_id}", params: valid_attributes }
        context 'when the user isn\'t authorized' do
          it 'returns an empty body' do
            expect(response.body).to be_empty
          end

          it 'returns status code 401' do
            expect(response).to have_http_status(401)
          end
        end
      end

      describe 'DELETE /api/v1/organizations/:id' do
        before { delete "/api/v1/organizations/#{organization_id}" }

        context 'when the user isn\'t authorized' do
          it 'returns an empty body' do
            expect(response.body).to be_empty
          end

          it 'returns status code 401' do
            expect(response).to have_http_status(401)
          end
        end
      end
    end
  end
end
