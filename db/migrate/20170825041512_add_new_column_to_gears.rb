class AddNewColumnToGears < ActiveRecord::Migration[5.0]
  def change
    add_column :gears, :strava_gear_id, :string
  end
end
