class SessionsController < ApplicationController

  def new
  end


  def create
    @user = strava_login_info
    user?
  end

  def destroy
    session.clear
    redirect_to root_path
  end

  private

  def strava_login_info
    User.strava_oauth2_call(params[:code])
  end

  def user?
    if @user
      session[:user_id] = @user.id
      current_user
      redirect_to dashboard_path(@user)
    else
      flash[:info] = "Unsuccesful log in attempt.  Do you have a Strava account?  If not please go to www.strava.com to sign up."
    end
  end

end
