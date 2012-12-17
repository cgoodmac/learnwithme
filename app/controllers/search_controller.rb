class SearchController < ApplicationController

  def index
  end

  def query
    query = params[:query]
    if query.present?
      @courses = Course.text_search(query).page(params[:page])
    else
      @courses = Course.page(params[:page])
    end
  end

end