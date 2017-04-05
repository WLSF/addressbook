Rails.application.routes.draw do

  namespace :api do
    namespace :v1 do
      get   'users'       => 'users#index'
      post  'users'       => 'users#create'
      get   'users/:id'   => 'users#show'
      put   'users/:id'   => 'users#update'
    end
  end

end
