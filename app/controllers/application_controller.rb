class ApplicationController < ActionController::Base
	protect_from_forgery with: :exception
	before_action :require_login
	def require_login
    redirect_to login_path unless session[:user_id]
  end
end
