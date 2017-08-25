class SessionsController < ApplicationController

  def new
  end


  def create
    strava_user_info = User.strava_oauth2_call(params[:code])
    @user = User.update_or_create(strava_user_info.symbolize_keys)
    Gear.update_or_create(strava_user_info.symbolize_keys[:bikes], @user.id)

    session[:user_id] = @user.id

    current_user
    redirect_to dashboard_path
  end

  def destroy
    session.clear
    redirect_to root_path
  end

  # private
  #
  # def oauth_info
  #   request.env["omniauth.auth"]
  # end

  # def oauth_login(user)
  #  if user && user.new_record?
  #    session[:omniauth_info] = oauth_info
  #    register_redirect(user)
  #  else
  #    session[:user_id] = user.id
  #    session[:authenticated] = true
  #    user_redirect(user)
  #  end
  # end

end
