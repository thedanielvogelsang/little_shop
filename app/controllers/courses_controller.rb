class CoursesController < ApplicationController
  def index
    @courses = Course.where(retired: nil)
  end

  def show
    id = params[:id].to_s
    @course = Course.find(id)
  end
end
