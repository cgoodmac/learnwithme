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

  def show
    @note = Note.find(params[:id])

  end

  def edit
    @note = Note.find(params[:id])
  end

  def update
    @note = Note.find(params[:id])

    if @note.update_attributes(params[:note])
      redirect_to @note, notice: 'Note was successfully updated.'
    else
      render action: "edit" 
    end
  end

  def destroy
    @note = Note.find(params[:id])
    @note.destroy

    redirect_to dashboard_path
  end
end