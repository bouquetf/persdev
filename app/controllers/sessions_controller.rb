class SessionsController < ApplicationController
  def create
    begin
      @user = User.from_omniauth(request.env['omniauth.auth'])
      session[:user_id] = @user.id
      logger.info domains_path
      redirect_to domains_path
    rescue
      flash[:warning] = "Problème lors de l'authentification"
      redirect_to root_path
    end
  end

  def destroy
    if current_user
      session.delete(:user_id)
      flash[:success] = 'Au revoir'
    end
    redirect_to root_path
  end
end
