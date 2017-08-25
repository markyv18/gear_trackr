Rails.application.config.middleware.use OmniAuth::Builder do
  provider :strava, ENV['STRAVA_ID'], ENV['STRAVA_SECRET'], scope: 'public'
end
# Rails.application.secrets.strava_client_id
# Rails.application.secrets.strava_api_key
