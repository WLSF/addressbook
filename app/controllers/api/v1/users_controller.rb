module Api
  module V1
    class UsersController < ApplicationController
      before_action :authenticate_user, except: [:create]

      def index
        render json: User.all, status: :ok
      end

      def show
        render json: User.find(params[:id]), status: :ok
      end

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

      def update
        user = User.update(params[:id], user_params)
        if user
          render json: user, status: :ok
        else
          respond_with_errors(user)
        end
      end

      def destroy
        user = User.find(params[:id])
        user.destroy
        render json: {:success=>true}, status: :ok
      end

      def user_params
        params.require(:user).permit(:name, :email, :password, :password_confirmation, :organization_id, {organization_ids: []}).except(:organization_id, :organization_ids)
      end

      def organization_params
        if params[:user].include?(:organization_id)
          params[:user][:organization_id]
        end
      end
    end
  end
end
