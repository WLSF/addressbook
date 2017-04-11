Apipie.configure do |config|
  config.app_name                = "AddressBook"
  config.app_info                = "Welcome to the AddressBook API Docs, everything about the endpoints can be found here."
  config.api_base_url            = "/"
  config.doc_base_url            = "/docs"
  # where is your API defined?
  config.api_controllers_matcher = "#{Rails.root}/app/controllers/**/*.rb"

  config.validate                = false
end
