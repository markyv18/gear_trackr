class CreateJoinTableUserGear < ActiveRecord::Migration[5.0]
  def change
    create_join_table :users, :gears do |t|
      # t.index [:gear_id, :user_id]
      # t.index [:user_id, :gear_id]
    end
  end
end
