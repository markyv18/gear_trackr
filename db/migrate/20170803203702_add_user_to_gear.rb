class AddUserToGear < ActiveRecord::Migration[5.0]
  def change
    add_reference :gears, :users, foreign_key: true
  end
end
