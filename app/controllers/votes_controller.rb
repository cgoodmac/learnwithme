class VotesController < ApplicationController

  def vote

    @course = Course.find(params[:course_id])  

    if params[:vote] == "up"
      @auth.vote_for(@course)

      e = Event.create(:event  => "voted up a course", :user_id => @auth.id, :course_id => @course.id)
    else
      @auth.vote_against(@course)

      e = Event.create(:event  => "voted down a course", :user_id => @auth.id, :course_id => @course.id)
    end
    
  end

  # def vote
  #   course = Course.find(params[:course_id])  
  #   @auth.vote_against(course)
  # end

end