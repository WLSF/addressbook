Rails.application.routes.draw do

  namespace :api do
    namespace :v1 do
      post    'contacts'      => 'contacts#create'
      delete  'contacts/:id'  => 'contacts#destroy'
      put     'contacts/:id'  => 'contacts#update'
    end
  end

end
