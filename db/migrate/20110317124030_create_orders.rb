class CreateOrders < ActiveRecord::Migration
  def self.up
    create_table :orders do |t|
      t.integer :user_id
      t.integer :address_id
      t.string :deliver_time
      t.string :sign
      t.integer :freight
      t.integer :total_money
      t.integer :status, :null => false, :default => 0

      t.timestamps
    end
  end

  def self.down
    drop_table :orders
  end
end
