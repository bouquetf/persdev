class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :current_user
  before_action :current_user

  private

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  rescue
    @current_user = nil
    session[:user_id] = nil
    nil
  end

  def check_connected
    if @current_user == nil
      render :status => :forbidden, :text => "Page accessible seulement connecté"
    end
  end

  def logged_in?
    current_user != nil
  end
end
