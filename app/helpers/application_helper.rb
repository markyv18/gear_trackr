module ApplicationHelper

  def home_button_toggle
    if logged_in?
      link_to "Gear Track'r", dashboard_path, :class => "navbar-brand page-scroll" # future: dashboard_path(@user)
    else
      link_to "Gear Track'r", root_path, :class => "navbar-brand page-scroll"
    end
  end

  def landing_service
    if logged_in?
      link_to "Your Gear Dashboard", dashboard_path, :class => "page-scroll" # future: dashboard_path(@user)
    else
      link_to image_tag('btn_strava_connectwith_light@2x.png'), "https://www.strava.com/oauth/authorize?client_id=#{ENV['STRAVA_ID']}&response_type=code&redirect_uri=http://localhost:3000/oauth2/:provider/callback"
    end
  end

  def navbar_logout
    if logged_in?
      link_to "Log Out", logout_path, :method => :delete
    else
      link_to "How it works", how_it_works_path, :class => "page-scroll"
    end
  end

# currently not using to simplify log in exerpience.
# when not logged in, you gotta click the link... site is useless otherwise
# when logged in we'll plop you on your dashboard.  boom done.  Saving this for future possiblilities.
  # def navbar_service
  #   if logged_in?
  #     link_to "Your Gear", dashboard_path, :class => "page-scroll" # future: dashboard_path(@user)
  #   else
  #     link_to "Connect with Strava", "https://www.strava.com/oauth/authorize?client_id=#{ENV['STRAVA_ID']}&response_type=code&redirect_uri=http://localhost/oauth2/:provider/callback", :class => "page-scroll" #(@user)
  #   end
  # end
  #below line of code goes in views/layouts/_navbar.html.erb
  # <li>
  #   <%= navbar_service %>
  #     <!-- when logged_in "your gear" version will need to pass (@user) or a (CORS-JSON instance of user) into route -->
  # </li>

end
