module Api
  module V1
    class UsersController < ApplicationController
      before_action :authenticate_user, except: [:create]

      resource_description do
        description 'This endpoints can be used by any User without Authentication'
      end

      api :POST, 'api/v1/users/', "Create a new User"
      param :user, Hash, :desc => "Param to hold the User information", :required => true do
        param :name, String, :desc => "Name of the User", :required => true
        param :email, String, :desc => "Email of the User", :required => true
        param :password, String, :desc => "Password of the User", :required => true
        param :password_confirmation, String, :desc => "Confirmation of the previous password", :required => true
        param :organization_id, [:number, Hash], :desc => "Organization ID, it can be a single ID or a list of id's", :required => true
      end
      error 400, 'Param is missing or the value is empty: user'
      error 404, 'Organization not found by organization_id'
      error 422, 'Params can\'t be blank, password is too short (8 - 20 chars) or password doesn\'t match'
      formats ['json']
      example 'HTTP Code: 201
{
  "id": 1,
  "name": "User Test",
  "email": "emailtest@gmail.com"
}'
      def create
        user = User.new(user_params)
        if user.save
          organization = Organization.find(organization_params)
          if organization
            user.organizations << organization
          end
          render json: user, status: :created
        else
          respond_with_errors(user)
        end
      end

      def user_params
        params.require(:user).permit(:name, :email, :password, :password_confirmation, :organization_id).except(:organization_id)
      end

      def organization_params
        if params[:user].include?(:organization_id)
          params[:user][:organization_id]
        end
      end
    end
  end
end
