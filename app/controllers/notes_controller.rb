class NotesController < ApplicationController
  def create
    if @auth.nil?

    else
      note = Note.create(:subject => params[:subject], :content => params[:content], :user_id => @auth.id, :course_id => params[:course_id])
      
      e = Event.create(:event => "wrote a note", :user_id => @auth.id, :course_id => params[:course_id], :note_id => note.id)

      @course = Course.find(params[:course_id])

      if @auth.courses.include? @course
      else
        @auth.courses << @course
      end 
    end  

    @notes_array = Note.where(:course_id => @course.id).where(:user_id => @auth.id)

    @all_notes_array = Note.where(:course_id => @course.id)

  end

  def show
    @note = Note.find(params[:id])

  end

  def edit
    @note = Note.find(params[:id])
    @course = Course.find(@note.course_id)
  end

  def update
    @note = Note.find(params[:id])

    if @note.update_attributes(params[:note])
      redirect_to dashboard_path, notice: 'Note was successfully updated.'
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