class HomeController < ApplicationController
  
  def index

    if @auth
      redirect_to dashboard_path
    end

    @course_count = Course.count

    seconds = Video.sum(:duration)
    @hours = seconds/3600

    @user_count = User.count

    @most_popular = Course.plusminus_tally.first

    @next_most_popular = Course.plusminus_tally.limit(5) - Course.plusminus_tally.limit(1)

  end

  def dashboard
    notmine = Course.all - @auth.courses
    @sample = notmine.sample(4)
  end

end