Rails.application.routes.draw do
  
  post    'session'       => 'user_token#create'
  delete  'session'       => 'user_token#signout'

end
