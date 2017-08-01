class AdminController < ApplicationController
  before_action :check_admin

  def show
    @user = current_user
  end
end
