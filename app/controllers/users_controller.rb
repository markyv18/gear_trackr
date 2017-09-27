class UsersController < ApplicationController

  def show
    @user = DashboardPresenter.new(current_user).user
  end

  def update
    @user = current_user
    if @user.update_attributes(user_params)
      flash[:info] = "successfully added #{params[:shop_name]} as your shop of record"
      redirect_to dashboard_path
    else
      flash[:info] = "unsuccesful update"
    end
  end

  private

  def user_params
    params.permit(:first_name,
                  :last_name,
                  :email,
                  :strava_id,
                  :strava_username,
                  :premium_user,
                  :num_of_followers,
                  :friend_count,
                  :date_format,
                  :measure_format,
                  :shop_name,
                  :shop_email)
  end

end
