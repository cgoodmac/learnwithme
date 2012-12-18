class CategoriesController < ApplicationController
  def index
    @categories = Category.order("name asc").page(params[:page])
  end

  def show
    @category = Category.find(params[:id])
    @courses = @category.courses.plusminus_tally.page(params[:page])
  end
end