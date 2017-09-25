Rails.application.routes.draw do

#landing page
  root 'home#index'

#short description explaining site's features
  get '/how-it-works', to: 'home#show'

#how we got here
  get '/about', to: 'home#new'

#callback after user has authorized strava and app to talk
  get '/oauth2/:provider/callback', to: 'sessions#create'

#where user lands after login process or having visited before
  get '/dashboard', to: 'users#show'

  get '/logout', to: 'sessions#destroy'

  # get '/login', to: 'sessions#new'
  #
  # post '/login', to: 'sessions#create'


end
