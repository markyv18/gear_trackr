# README

##GEAR TRACKR

https://geartrackr.herokuapp.com

-----------------------------------------------------
List Athlete Activities (http://strava.github.io/api/v3/activities/#get-activities)

Use below API call and parameters to retrieve...
https://www.strava.com/api/v3/athlete/activities?access_token=e394a43274d4eeda8bdf0ddb09916f3fda257f70&per_page=100
returns an array of activity hashes (100 per page)

||= if user has an entry in "last_call_date" if not ask user to input date from which they want to retrieve gear use data.  I.e. when do they want to start accumulating the miles.

_before_:	integer optional - seconds since UNIX epoch, result will start with activities whose start_date is before this value
_after_:	integer optional - seconds since UNIX epoch, result will start with activities whose start_date is after this value, sorted oldest first
_per_page_:	integer optional (number of results per page)

when revisiting

will need UNIX time converter from user input to search API call.

From that array, loop thru and extract from each activity the following 3 attributes.  (store, not store?)

{
        "distance": 15364.3,
        "moving_time": 2537,
        "gear_id": "b1497616",
    },


    {     "id"=>987148,
          "username"=>"markyv",
          "firstname"=>"Mark",
          "lastname"=>"Van Akkeren",
          "email"=>"markavan@hotmail.com",

  # might be useful for upselling options
          "premium"=>false,

  # might be useful for...?
          "follower_count"=>55,
          "friend_count"=>26,
          "clubs"=>[],

  # these might come in handy for display preferences when they are setting thresholds
          "date_preference"=>"%m/%d/%Y",
          "measurement_preference"=>"feet",

          "bikes"=>
                  [{"id"=>"b4048559", "primary"=>false, "name"=>"Crui-mmuter", "resource_state"=>2, "distance"=>0.0},
                   {"id"=>"b4048706", "primary"=>false, "name"=>"MTB", "resource_state"=>2, "distance"=>109305.0},
                   {"id"=>"b1497617", "primary"=>false, "name"=>"P3", "resource_state"=>2, "distance"=>248936.0},
                   {"id"=>"b1497616", "primary"=>true, "name"=>"S1", "resource_state"=>2, "distance"=>2103022.0}
          ],
          "shoes"=>[{"id"=>"g2435966", "primary"=>false, "name"=>"Altra Superior Blue", "resource_state"=>2, "distance"=>0.0},
                    {"id"=>"g2435965", "primary"=>true, "name"=>"Altra The One 2.5 Red", "resource_state"=>2, "distance"=>0.0},
                    {"id"=>"g2435967", "primary"=>false, "name"=>"Altra Lone Peak Mid Hiker Yellow", "resource_state"=>2, "distance"=>0.0}
          ]
    }




adding in bcrypt later https://github.com/codahale/bcrypt-ruby/tree/master

---------------------------------------------------------------------------
---------------------------------------------------------------------------
---------------------------------------------------------------------------
---------------------------------------------------------------------------
---------------------------------------------------------------------------
---------------------------------------------------------------------------

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
