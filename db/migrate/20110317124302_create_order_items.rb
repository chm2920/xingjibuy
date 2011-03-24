class CreateOrderItems < ActiveRecord::Migration
  def self.up
    create_table :order_items do |t|
      t.integer :order_id
      t.integer :deal_id
      t.integer :quantity, :null => false, :default => 0
    end
  end

  def self.down
    drop_table :order_items
  end
end
