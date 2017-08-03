class UsersController < ApplicationController
  # before_action :current_user

  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    if @user.save
      session[:user_id] = @user.id
      flash[:notice] = "Logged in as #{@user.username}"
    end
    redirect_to dashboard_path(user_id: @user.id)
  end

  def show
  end

  def edit
    @user = current_user
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    if current_user.admin?
      redirect_to admin_dashboard_path
    elsif @user == current_user
    render :show
    else
      redirect_back(fallback_location: root_path)
    end
  end

  private

  def user_params
    params.require(:user).permit(:first_name,
                                 :last_name,
                                 :username,
                                 :password,
                                 :street_address,
                                 :unit_number,
                                 :city,
                                 :state,
                                 :zip_code)
  end
end
