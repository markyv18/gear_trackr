class ApplicationController < ActionController::Base
  helper_method :current_user
  helper_method :logged_in?
  # helper_method :omniauth_user
  protect_from_forgery with: :exception

  # include FlashMessages

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  # def omniauth_user
  #   @omniauth_info ||= session[:omniauth_info] if session[:omniauth_info]
  # end

  def logged_in?
    session[:user_id] != nil #&& session[:authenticated]
  end

end
