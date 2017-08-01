class UsersController < ApplicationController
  before_action :current_user

  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    if @user.save
      session[:user_id] = @user.id
      flash[:notice] = "Logged in as #{@username}"
    end
    redirect_to dashboard_path(:user_id => @user.id)
  end

  def show
    @user = User.find(params[:user_id].to_i)
  end

  def edit
    @user = current_user
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    if @user.save
      redirect_to admin_dashboard_path
    else
      redirect_back(fallback_location: edit_user_path)
    end
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :username, :password, :email)
  end
end
