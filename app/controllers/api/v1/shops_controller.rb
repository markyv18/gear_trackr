class Api::V1::ShopsController < ApplicationController
  def index
    @shops = Shop.find_a_shop(params[:location])
    render json: @shops
  end
end
