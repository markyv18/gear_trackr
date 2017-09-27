class AddShopAndEmailToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :shop_name, :string
    add_column :users, :shop_email, :string
  end
end
