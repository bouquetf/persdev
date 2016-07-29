class HomeController < ApplicationController
  def show
    if @current_user
      redirect_to domains_path
    end
  end
end
