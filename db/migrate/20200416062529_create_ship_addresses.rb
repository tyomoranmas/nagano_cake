class CreateShipAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :ship_addresses do |t|
      t.integer :end_user_id
      t.string :address
      t.string :post_code
      t.string :address_name

      t.timestamps
    end
  end
end
