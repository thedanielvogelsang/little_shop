class CoursesController < ApplicationController
  def index
    if params[:search]
      @courses = Course.search
    else
      @courses = Course.active
    end
  end

  def show
    id = params[:id].to_s
    @course = Course.find(id)
  end
end
