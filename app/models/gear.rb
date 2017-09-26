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

  # "bikes"=>[
#    https://apidock.com/rails/v4.0.2/ActiveRecord/Relation/find_or_create_by
  #           {"id"=>"b4048559", "primary"=>false, "name"=>"Crui-mmuter", "resource_state"=>2, "distance"=>0.0},
  #           {"id"=>"b4048706", "primary"=>false, "name"=>"MTB", "resource_state"=>2, "distance"=>109305.0},
  #           {"id"=>"b1497617", "primary"=>false, "name"=>"P3", "resource_state"=>2, "distance"=>248936.0},
  #           {"id"=>"b1497616", "primary"=>true, "name"=>"S1", "resource_state"=>2, "distance"=>2488024.0}],
  #
  # "shoes"=>[{"id"=>"g2435966", "primary"=>false, "name"=>"Altra Superior Blue", "resource_state"=>2, "distance"=>0.0},
  #           {"id"=>"g2435965", "primary"=>true, "name"=>"Altra The One 2.5 Red", "resource_state"=>2, "distance"=>0.0},
  #           {"id"=>"g2435967", "primary"=>false, "name"=>"Altra Lone Peak Mid Hiker Yellow", "resource_state"=>2, "distance"=>8851.0}]}

end

# convert UNIX timestamp to ruby date time and reverse
# expecting user to enter a date(s) with which to search data, then storing the
# ...current search date to act as new bookend when returning
#
# require 'date'
# DateTime.strptime("1318996912",'%s')
