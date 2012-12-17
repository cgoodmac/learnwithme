class NotesController < ApplicationController
  def create
    if @auth.nil?

    else
      note = Note.create(:subject => params[:subject], :content => params[:content], :user_id => @auth.id, :course_id => params[:course_id])
    
      course = Course.find(params[:course_id])

      if @auth.courses.include? course
      else
        @auth.courses << course
      end 
    end  
  end
end