class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(username: params[:session][:username])
    if @user && @user.authenticate(params[:session][:password])
      session[:user_id] = @user.id
      flash[:success] = "Logged in as #{@user.username}"
      if @user.admin?
        redirect_to admin_dashboard_path(:user_id => @user)
      else
        redirect_to dashboard_path(:user_id => @user.id)
      end
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

  private

    def user_path

    end
end
