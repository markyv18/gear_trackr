class AddBikeShopInfoToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :bike_shop, :string
    add_column :users, :bike_shop_email, :string
  end
end
