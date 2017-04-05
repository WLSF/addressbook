Rails.application.routes.draw do

  namespace :api do
    namespace :v1 do
      #get     'contacts'      => 'contacts#index'
      post    'contacts'      => 'contacts#create'
      #get     'contacts/:id'  => 'contacts#show'
      delete  'contacts/:id'  => 'contacts#destroy'
      put     'contacts/:id'  => 'contacts#update'
    end
  end

end
