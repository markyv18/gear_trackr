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

  # def welcome_email
  #   SendEmailJob.perform_later(self)
  # end


end
