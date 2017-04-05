class ApplicationController < ActionController::API
  include Knock::Authenticable
  include Authority::Controller
  before_action :authenticate_user

  def respond_with_errors(object)
    render json: {errors: ErrorSerializer.serialize(object)}, status: :unprocessable_entity
  end
end
