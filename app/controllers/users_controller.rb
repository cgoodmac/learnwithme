class UsersController < ApplicationController
  def index
    @users = User.page(params[:page])
  end

  def new
    @user = User.new
  end

  def create
    full_name = params[:full_name]
    email = params[:email]
    password = params[:password]
    password_confirmation = params[:password_confirmation]

    @user = User.create(:full_name => full_name, :email => email, :password => password, :password_confirmation => password_confirmation, :remote_image_url => "http://bossymoksie.files.wordpress.com/2012/06/blank_avatar_220.png")
    session[:user_id] = @user.id

    redirect_to dashboard_path
  end

  def edit
    if params[:id].to_i == @auth.id
      @user = User.find(params[:id])
    else
      redirect_to dashboard_path
    end
  end

  def show
    @user = User.find(params[:id])
    @courses_by = Course.where(:teacher_id => @user.id).page(params[:page])
  end

  def update
    @user = User.find(params[:id])

    if @user.update_attributes(params[:user])
      redirect_to @user
    else
      render :edit
    end
  end

  def follow
    @user = User.find(params[:user_id])
    follower = @auth
    follower.follow(@user)
  end

  def unfollow 
    @user = User.find(params[:user_id])
    @auth.stop_following(@user)
  end
end