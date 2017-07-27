class CoursesController < ApplicationController
  def index
    @courses = Course.all
  end

  def show
    id = params[:id].to_s
    @course = Course.find(id)
  end
end
