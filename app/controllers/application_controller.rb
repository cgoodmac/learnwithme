class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :authenticate_user

  private

  def authenticate_user
    if session[:user_id]
      @auth = User.find(session[:user_id])
    else
      @auth = nil
    end
  end

end
