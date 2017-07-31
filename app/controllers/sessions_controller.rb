class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(username: params[:session][:username])
    if @user && @user.authenticate(params[:session][:password])
      session[:user_id] = @user.id
      flash[:success] = "Logged in as #{@user.username}"
      redirect_to dashboard_path(:user_id => @user.id)
    else
      flash[:error] = "Invalid login"
      redirect_to('/login')
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:notice] = 'Goodbye'

    redirect_to root_path
  end
end
