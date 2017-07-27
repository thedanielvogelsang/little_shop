class UsersController < ApplicationController
  def show
    @user = User.find(params[:user_id])
    # if @user == current_user
    #   render :show
    # else
    #   render file: "public/404"
    # end
  end
end
