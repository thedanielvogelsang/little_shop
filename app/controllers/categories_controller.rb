class CategoriesController < ApplicationController

  def show
    @category = Category.friendly.find(params[:category_id])
  end

  def index
    if params[:search].present?
      @categories = CategoryCourseSearch.new(query: params[:search]).results
    else
      @categories = Category.all
    end
  end
end
