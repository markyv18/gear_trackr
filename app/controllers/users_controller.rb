class UsersController < ApplicationController
  # before_filter :omniauth_user

  def show
    @user = current_user
  end

  def new
    @user = User.new
  end

  # def create
  #   @user = User.new(user_params)
  #   @user.uid = session[:omniauth_info]['uid'] if omniauth_user
  #   if @user.save
  #     ConfirmationSender.send_confirmation_to(@user)
  #     session[:user_id] = @user.id
  #     session.delete(:omniauth_info)
  #     redirect_to twilio_confirmation_path
  #   else
  #     flash.now[:danger] = @user.errors.full_messages
  #     render :new
  #   end
  # end
  #
  # private
  #
  #   def user_params
  #     params.require(:user).permit(:first_name,
  #                                  :last_name,
  #                                  :email)
  #   end

end
