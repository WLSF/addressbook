class UserTokenController < Knock::AuthTokenController

  resource_description do
    description 'This endpoint can be used by any User to login'
  end

  api :POST, 'session', "Create a new User session (Login)"
  param :auth, Hash, :desc => "Param to hold the Auth information", :required => true do
    param :email, String, :desc => "Email to login", :required => true
    param :password, String, :desc => "Password to login", :required => true
  end
  error 400, 'Param is missing or the value is empty: auth'
  error 404, 'User not found by credentials'
  formats ['json']
  example "HTTP Code: 201
{
  \"jwt\": \"eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJleHAiOjE0OTIwMjU3NTUsInN1YiI6MX0.03LGoQHS4GMR_fI7MHw8H-DpEkakOlM-QCY0IgGb3M0\"
}"
  def create
    super
  end

end
