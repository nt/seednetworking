RailsAdmin.config do |config|
  config.authorize_with do 
    redirect_to root_path unless current_user.admin
  end
end