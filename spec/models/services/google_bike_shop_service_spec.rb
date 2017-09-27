require 'rails_helper'

describe GoogleBikeShopService do
  it 'has specific keys' do
    zip = 80305
    bike_shops = GoogleBikeShopService.shop_query(zip)

    expect(bike_shops[0]).to be_a Hash
    expect(bike_shops[0]).to have_key(:name)
    
  end
end
