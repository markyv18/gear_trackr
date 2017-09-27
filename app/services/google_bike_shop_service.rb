class GoogleBikeShopService

  def self.shop_query(location)
    lat_long = find_lat_long(location)
    response = Faraday.get("https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=#{lat_long[:lat]},#{lat_long[:lng]}&radius=3000&key=#{ENV['GOOGLE_KEY']}&keyword=bikerepair&types=bicycle_store&rankBy=distance")
    JSON.parse(response.body, symbolize_names: true)[:results]
  end

  def self.find_lat_long(location)
    response = Faraday.get("https://maps.googleapis.com/maps/api/geocode/json?address=#{location}&key=#{ENV['GOOGLE_GEOCODE_KEY']}")
    JSON.parse(response.body, symbolize_names: true)[:results][0][:geometry][:location]
  end

end
