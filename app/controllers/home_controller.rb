class HomeController < ApplicationController
  def show
    if @current_user
      redirect_to today_agenda_path
    end
  end
end
