class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.integer :end_user_id
      t.string :post_code
      t.string :address_name
      t.string :address
      t.integer :postage, default: 800
      t.integer :total
      t.integer :payment, default: 0
      t.integer :status, default: 0

      t.timestamps
    end
  end
end
