module Api
  module V1
    class OrganizationsController < ApplicationController
      authorize_actions_for Organization

      def index
        render json: Organization.all, status: :ok
      end

      def show
        render json: Organization.find(params[:id]), status: :ok
      end

      def create
        organization = Organization.new(organization_params)
        if organization.save
          render json: organization, status: :created
        else
          respond_with_errors(organization)
        end
      end

      def update
        organization = Organization.update(params[:id], organization_params)
        if organization
          render json: organization, status: :ok
        else
          respond_with_errors(organization)
        end
      end

      def destroy
        organization = Organization.find(params[:id])
        organization.destroy
        render json: {:success=>true}, status: :ok
      end

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
