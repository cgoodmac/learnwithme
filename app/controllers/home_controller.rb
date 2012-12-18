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
    @sample = notmine.sample(1)

    following_id_array = []
    @events = []

    @auth.follows.each do |following|
      following_id_array << following.followable_id
    end

    following_id_array.each do |following_id|
      each_user_events = Event.where(:user_id => following_id).limit(3) #gets all the events for each user
       
      each_user_events.each do |event|  
        @events << event
      end

    end 

    @events = @events.sort_by {|event| event.created_at}

  end

end