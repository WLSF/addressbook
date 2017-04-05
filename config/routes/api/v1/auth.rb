Rails.application.routes.draw do

  post    'session'       => 'user_token#create'

end
