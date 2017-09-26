class Gear < ApplicationRecord
  validates :name, presence: true
  validates :total_distance_in_meters, presence: true
  validates :strava_gear_id, uniqueness: true, presence: true

  belongs_to :user, optional: true

  def self.update_or_create(gear_info, user)
    gears = Gear.find_by(strava_id: gear_info[:id]) || User.new
    byebug
    gears.each do |gear|
      byebug
      gear.name                     =  gear_info[:name]
      gear.total_distance_in_meters =  gear_info[:distance]
      gear.strava_gear_id           =  gear_info[:id]
      gear.users_id                 =  gear_info[:id]
      gear.save!
    end
  end

  [{"id"=>"b4048559", "name"=>"Crui-mmuter", "distance"=>0.0},
   {"id"=>"b4048706", "name"=>"MTB", "distance"=>109305.0},
   {"id"=>"b1497617", "name"=>"P3", "distance"=>248936.0},
   {"id"=>"b1497616", "name"=>"S1", "distance"=>2103022.0}]
end

# convert UNIX timestamp to ruby date time and reverse
# expecting user to enter a date(s) with which to search data, then storing the
# ...current search date to act as new bookend when returning
#
# require 'date'
# DateTime.strptime("1318996912",'%s')
