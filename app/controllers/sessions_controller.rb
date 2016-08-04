class SessionsController < ApplicationController
  def create
    begin
      @user = User.from_omniauth(request.env['omniauth.auth'])
      session[:user_id] = @user.id
    rescue
      flash[:warning] = "Problème lors de l'authentification"
    end
    redirect_to root_path
  end

  def destroy
    if current_user
      session.delete(:user_id)
      flash[:success] = 'Au revoir'
    end
    redirect_to root_path
  end
end
