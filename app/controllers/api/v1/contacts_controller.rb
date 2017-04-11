module Api
  module V1
    class ContactsController < ApplicationController
      authorize_actions_for Contact

      resource_description do
        description 'This endpoints can be used by any Authenticated User'
        error 401, 'Unauthorized'
        formats ['json']
      end

      api :POST, 'api/v1/contacts/', "Create a new Contact"
      param :contact, Hash, :desc => "Param to hold the Contact information", :required => true do
        param :name, String, :desc => "Name of the Contact", :required => true
        param :organization_id, :number, :desc => "Organization ID to attach on Contact", :required => true
      end
      error 400, 'Param is missing or the value is empty: contact'
      error 422, 'Params can\'t be blank'
      example 'HTTP Code: 201
{
  "id": 1,
  "name": "Contact name"
}'
      def create
        contact = Contact.new(contact_params)
        if contact.save
          render json: contact, status: :created
        else
          respond_with_errors(contact)
        end
      end

      api :PUT, 'api/v1/contacts/:id/', "Update an existing Contact"
      param :id, :number, :desc => "ID of the Contact to update", :required => true
      param :contact, Hash, :desc => "Param to hold the Contact information", :required => true do
        param :name, String, :desc => "Name of the Contact", :required => true
        param :organization_id, :number, :desc => "Organization ID to attach on Contact", :required => true
      end
      error 400, 'Param is missing or the value is empty: contact'
      error 404, 'Contact not found by id'
      error 422, 'Params can\'t be blank'
      example 'HTTP Code: 201
{
  "id": 1,
  "name": "Contact name"
}'
      def update
        contact = Contact.update(params[:id], contact_params)
        if contact
          render json: contact, status: :ok
        else
          respond_with_errors(contact)
        end
      end

      api :DELETE, 'api/v1/contacts/:id/', "Delete an existing Contact"
      param :id, :number, :desc => "ID of the Contact to delete", :required => true
      error 404, 'Contact not found by id'
      example 'HTTP Code: 200
{
  "success": true
}'
      def destroy
        contact = Contact.find(params[:id])
        contact.destroy
        render json: {:success=>true}, status: :ok
      end

      def contact_params
        params.require(:contact).permit(:name, :organization_id)
      end
    end
  end
end
