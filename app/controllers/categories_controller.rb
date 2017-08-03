class CategoriesController < ApplicationController
  def show
    @category = Category.friendly.find(params[:category_id])
  end
  
  def index
    if params[:search].present?
      @categories = Category.search(params[:search])
    else
      @categories = Category.all
    end
  end
end
