class Admin::AdminController < ApplicationController
  before_action :check_admin

  def check_admin
    render file: 'public/404' unless current_admin
  end
end
