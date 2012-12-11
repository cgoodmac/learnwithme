class CoursesController < ApplicationController

  def index
    @courses = Course.where(:user_id => @auth)
  end

  def show
    course_id = params[:id]
    @course = Course.find(course_id)
  end

  def new
    @course = Course.new
    teacher_objects = User.where(:is_teacher => "on")
    @teachers = teacher_objects.map {|teacher| ["#{teacher.first_name} #{teacher.last_name}"]  }
  end

  def edit
    @course = Course.find(params[:id])
  end

  def create
    teacher_first = params[:teacher].split(' ').first
    teacher_last = params[:teacher].split(' ').last
    teacher_id = User.where(:is_teacher => "on").where(:first_name => teacher_first).where(:last_name => teacher_last).first.id

    c = Course.new
    c.title = params[:course][:title]
    c.description = params[:course][:description]
    c.price = params[:course][:price]
    c.image_cache = params[:course][:image_cache]
    c.remote_image_url = params[:course][:remote_image_url]
    c.teacher_id = teacher_id
    c.save
    
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



end