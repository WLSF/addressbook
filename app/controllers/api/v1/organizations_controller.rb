module Api
  module V1
    class OrganizationsController < ApplicationController
      authorize_actions_for Organization

      resource_description do
        description 'This endpoints can be used only by the Admin user'
        error 401, 'Unauthorized'
        formats ['json']
      end

      api :GET, 'api/v1/organizations', "List all Organizations"
      example 'HTTP Code: 201,
[
  {
    "id": 1,
    "name": "Organization name"
  }
]'
      def index
        render json: Organization.all, status: :ok
      end

      api :GET, 'api/v1/organizations/:id/', "Get Organization by ID"
      param :id, :number, :desc => "ID of the Organization to show", :required => true
      error 404, 'Organization not found by id'
      example 'HTTP Code: 201,
{
  "id": 1,
  "name": "Organization name"
}'
      def show
        render json: Organization.find(params[:id]), status: :ok
      end

      api :POST, 'api/v1/organizations/', "Create a new Organization"
      param :organization, Hash, :desc => "Param to hold the Organization information", :required => true do
        param :name, String, :desc => "Name of the Organization", :required => true
      end
      error 400, 'Param is missing or the value is empty: user'
      error 422, 'Params can\'t be blank'
      example 'HTTP Code: 200,
{
  "id": 1,
  "name": "Organization name"
}'
      def create
        organization = Organization.new(organization_params)
        if organization.save
          render json: organization, status: :created
        else
          respond_with_errors(organization)
        end
      end

      api :PUT, 'api/v1/organizations/:id/', "Update an existing Organization"
      param :id, :number, :desc => "ID of the Organization to update", :required => true
      param :organization, Hash, :desc => "Param to hold the Organization information", :required => true do
        param :name, String, :desc => "Name of the Organization", :required => true
      end
      error 400, 'Param is missing or the value is empty: user'
      error 404, 'Organization not found by id'
      error 422, 'Params can\'t be blank'
      example 'HTTP Code: 200,
{
  "id": 1,
  "name": "Organization name"
}'
      def update
        organization = Organization.update(params[:id], organization_params)
        if organization
          render json: organization, status: :ok
        else
          respond_with_errors(organization)
        end
      end

      api :DELETE, 'api/v1/organizations/:id/', "Delete an existing Organization"
      param :id, :number, :desc => "ID of the Organization to delete", :required => true
      error 404, 'Organization not found by id'
      example 'HTTP Code: 200
{
  "success": true
}'
      def destroy
        organization = Organization.find(params[:id])
        organization.destroy
        render json: {:success=>true}, status: :ok
      end

      api :GET, 'api/v1/organizations/:id/addressbook', "Retrieves all contacts from an existing Organization"
      param :id, :number, :desc => "ID of the Organization", :reqiured => true
      error 404, 'Organization not found by id'
      example 'HTTP Code: 201
[
  {
    "id": "-Kh08pY5uMCtTFylCpur",
    "name": "Contact 2"
  }
]'
      def contacts
        organization = Organization.find(params[:id])
        contacts = organization.contacts()
        render json: contacts, status: :ok
      end

      def organization_params
        params.require(:organization).permit(:name)
      end
    end
  end
end
