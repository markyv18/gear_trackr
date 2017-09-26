class User < ApplicationRecord
  validates :email, presence: true, uniqueness: true
  validates :strava_id, presence: true, uniqueness: true

  has_many :gears

  def self.strava_oauth2_call(params_code)
    response = Faraday.post("https://www.strava.com/oauth/token?client_id=#{ENV['STRAVA_ID']}&client_secret=#{ENV['STRAVA_SECRET']}&code=#{params_code}")
    @token = response.body.split(/\W+/)[2]
    oauth_response = Faraday.get("https://www.strava.com/api/v3/athlete?access_token=#{@token}")
    self.update_or_create(JSON.parse(oauth_response.body, symbolize_names: true))
  end

  def self.update_or_create(user_info)
    user = User.find_or_create_by(strava_id: user_info[:id]) do |user|
      user.strava_id =          user_info[:id]
      user.strava_username =    user_info[:username]
      user.first_name =         user_info[:firstname]
      user.last_name =          user_info[:lastname]
      user.email =              user_info[:email]
      user.premium_user =       user_info[:premium]
      user.num_of_followers =   user_info[:follower_count]
      user.friend_count =       user_info[:friend_count]
      user.date_format =        user_info[:date_preference]
      user.measure_format =     user_info[:measurement_preference]
      user.access_token =       @token
      #add in additional attributes as needed here =
      user.save
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

  # def welcome_email
  #   SendEmailJob.perform_later(self)
  # end


end
