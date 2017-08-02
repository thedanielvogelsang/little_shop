class Admin::CoursesController < ApplicationController

  def index
    @courses = Course.all
  end

  def new
    @categories = Category.all
    @course = Course.new
  end

  def create
    @course = Course.new(course_params)
    if @course.save
      flash[:success] = "#{@course.title} successfully created!"
      redirect_to admin_courses_path
    else
      render :new
    end

    def show
      @course = Course.find(params[:id])
    end

  end

  private

    def course_params
      params.require(:course).permit(:title, :description, :price, :image, :category_id)
    end
end
