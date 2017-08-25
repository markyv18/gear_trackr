class DropGearsUsersTable < ActiveRecord::Migration[5.0]

  def up
    drop_table :gears_users
  end

  def down
    fail ActiveRecord::IrreversibleMigration
  end

end
