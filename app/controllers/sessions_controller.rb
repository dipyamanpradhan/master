class SessionsController < ApplicationController
  skip_before_action :require_login
  def new
  end

  def create
    user = Teacher.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      flash[:success] = 'Logged in Successfully.'
      redirect_to home_path
    else
      redirect_to login_path
      flash[:alert] = 'Invalid email or password'
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to login_path, notice: 'Logged out successfully'
  end
end
