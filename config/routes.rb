Rails.application.routes.draw do

  def draw(routes_name, version)
    instance_eval(File.read(Rails.root.join("config/routes/api/#{version}/#{routes_name}.rb")))
  end

  draw :auth,           :v1
  draw :users,          :v1
  draw :contacts,       :v1
  draw :organizations,  :v1

end
