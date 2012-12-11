class HomeController < ApplicationController
  
  def index

    if @auth
      redirect_to dashboard_path
    end

  end

  def dashboard
    
  end

end