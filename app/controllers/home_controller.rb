class HomeController < ApplicationController
  
  def index

    if @auth
      redirect_to dashboard_path
    end

    @course_count = Course.count

    seconds = Video.sum(:duration)
    @hours = seconds/3600

    @user_count = User.count

  end

  def dashboard
    notmine = Course.all - @auth.courses
    @sample = notmine.sample(4)
  end

end