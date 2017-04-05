Rails.application.routes.draw do

  namespace :api do
    namespace :v1 do
      get     'organizations'                   => 'organizations#index'
      post    'organizations'                   => 'organizations#create'
      get     'organizations/:id'               => 'organizations#show'
      delete  'organizations/:id'               => 'organizations#destroy'
      put     'organizations/:id'               => 'organizations#update'
      get     'organizations/:id/addressbook'   => 'organizations#contacts'
    end
  end

end
