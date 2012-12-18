class CoursesController < ApplicationController

  def index
    @courses = Course.page(params[:page])
  end

  def show
    course_id = params[:id]
    @course = Course.find(course_id)
    @teacher = User.find(@course.teacher_id)

    if @auth != nil
     @notes_array = Note.where(:course_id => @course.id).where(:user_id => @auth.id)
    end

    @all_notes_array = Note.where(:course_id => @course.id)
  end

  def new
    @course = Course.new
    teacher_objects = User.where(:is_teacher => "on")
    @teachers = teacher_objects.map {|teacher| ["#{teacher.first_name} #{teacher.last_name}"]  }
  end

  def edit
    if @auth.is_admin == "on"
      @course = Course.find(params[:id])
      teacher_objects = User.where(:is_teacher => "on")
      @teachers = teacher_objects.map {|teacher| ["#{teacher.first_name} #{teacher.last_name}"]  }
    else
      redirect_to dashboard_path
    end
  end

  def create
    
    c = Course.new

    c.title = params[:title]
    c.description = params[:description]
    c.price = params[:price]
    c.image_cache = params[:image_cache]
    c.remote_image_url = params[:remote_image_url]
    c.teacher_id = @auth.id
    c.save

    if params[:video_link] != ""
      v = Video.create(:title => params[:video_title], :link => params[:video_link])
      c.videos << v
    end

    if params[:ebook_file] != ""
      params[:ebook_title] ||= "Untitled"
      ebook = Ebook.create(:title => params[:ebook_title], :ebook_file => params[:ebook_file], :image => params[:ebook_image])
      c.ebooks << ebook
    end

    if params[:audio_file] != ""
      params[:audio_title] ||= "Untitled"
      audio = Audio.create(:title => params[:audio_title], :audio_file => params[:audio_file])
      c.audios << audio
    end

    e = Event.new(:string => "#{@auth.full_name} created a course", :user_id => @auth.id)
    redirect_to courses_path
  end

  def update
    @course = Course.find(params[:id])

    if @course.update_attributes(params[:course])
      redirect_to @course
    else
      render :edit
    end
  end

  def destroy
    course = Course.find(params[:id])
    course.delete
    redirect_to courses_path
  end

  def save
    course = Course.find(params[:course_id])

    if @auth.courses.include? course
    else  
      @auth.courses << course
    end
  end

  def popular
    @courses = Course.plusminus_tally.page(params[:page])
  end

end