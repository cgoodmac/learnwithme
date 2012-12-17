class VotesController < ApplicationController

  def vote

    @course = Course.find(params[:course_id])  

    if params[:vote] == "up"
      @auth.vote_for(@course)
    else
      @auth.vote_against(@course)
    end
    
  end

  # def vote
  #   course = Course.find(params[:course_id])  
  #   @auth.vote_against(course)
  # end

end