module Api
  module V1
    class ContactsController < ApplicationController
      authorize_actions_for Contact

      def index
        render json: Contact.all, status: :ok
      end

      def show
        render json: Contact.find(params[:id]), status: :ok
      end

      def create
        contact = Contact.new(contact_params)
        if contact.save
          render json: contact, status: :created
        else
          respond_with_errors(contact)
        end
      end

      def update
        contact = Contact.update(params[:id], contact_params)
        if contact
          render json: contact, status: :ok
        else
          respond_with_errors(contact)
        end
      end

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
