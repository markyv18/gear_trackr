class AddNewColumnToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :strava_id, :string
    add_column :users, :access_token, :string
  end
end
