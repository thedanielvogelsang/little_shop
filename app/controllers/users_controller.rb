class UsersController < ApplicationController
  def show
    @user = User.find_by(params[:course_id])
  end
end
