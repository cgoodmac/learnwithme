class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    email = params[:email]
    password = params[:password]
    password_confirmation = params[:password_confirmation]

    @user = User.create(:email => email, :password => password, :password_confirmation => password_confirmation)
    email = @user.email
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
    @start = @user.created_at.to_s
  end

  def update
    @user = User.find(params[:id])

    if @user.update_attributes(params[:user])
      redirect_to @user
    else
      render :edit
    end
  end
end