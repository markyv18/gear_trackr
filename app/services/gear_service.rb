


# use this service to make the intermitten calls thoughout the week to update
# all users stats
# i.e. need some form of CHRON function in here to initiate this refresh call

# class GearService
#
#   def self.find_stations(zipcode)
#     response = Faraday.get("https://api.data.gov/nrel/alt-fuel-stations/v1/nearest.json?api_key=#{ENV["NREL_USER_KEY"]}&fuel_type=ELEC,LPG&location=#{zipcode}&limit=10&radius=6")
#     just_the_stations= JSON.parse(response.body, symbolize_names: true)[:fuel_stations]
#     just_the_stations.map do |station|
#       Station.new(station)
#     end
#   end
#
# end
#
#
# class NrelRequest
#   attr_reader :api_key
#
#   def initialize(api_key)
#     @api_key = api_key
#   end
#
#   def nearest_stations(zip_code)
#     conn = Faraday.new("https://api.data.gov/")
#     response = conn.get "nrel/alt-fuel-stations/v1/nearest.json", {
#       limit: 10,
#       location: zip_code,
#       radius: 6.0,
#       fuel_type: "ELEC,LPG",
#       api_key: api_key
#     }
#     results = JSON.parse(response.body)
#     results["fuel_stations"]
#   end
#
# end
