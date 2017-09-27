# class Api::V1::UsersController < ApplicationController
#   def update
#     @user = current_user
#     if @user.update_attributes(user_params)
#       flash[:info] = "successfully added #{params[:shop_name]} as your shop of record"
#       redirect_to dashboard_path
#     else
#       flash[:info] = "unsuccesful update"
#     end
#   end
# end
