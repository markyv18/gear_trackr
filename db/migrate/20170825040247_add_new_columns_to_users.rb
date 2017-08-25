class AddNewColumnsToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :premium_user, :boolean
    add_column :users, :num_of_followers, :integer
    add_column :users, :friend_count, :integer
    add_column :users, :date_format, :string
    add_column :users, :measure_format, :string
  end
end
