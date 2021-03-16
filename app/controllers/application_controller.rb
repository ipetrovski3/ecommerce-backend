class ApplicationController < ActionController::API
  # Uncomment below line when ready to sign_in as an Admin and change stuff
  # before_action :authenticate_admin!
  
  respond_to :json
end
