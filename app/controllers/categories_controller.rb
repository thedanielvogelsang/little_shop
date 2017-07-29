class CategoriesController < ApplicationController

  def show
    @category = Category.friendly.find(params[:category_id])
  end

  def index
    @categories = Category.search(params[:search])
  end

end
