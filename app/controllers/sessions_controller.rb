class SessionsController < ApplicationController
  def new
    if @auth
      redirect_to dashboard_path
    else
    end
  end

  def create 
    user = User.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to dashboard_path
    else
      render :new
    end
  end 

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end



end