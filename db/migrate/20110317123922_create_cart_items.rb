class CreateCartItems < ActiveRecord::Migration
  def self.up
    create_table :cart_items do |t|
      t.integer :cart_id
      t.integer :deal_id
      t.integer :quantity, :null => false, :default => 1
    end
  end

  def self.down
    drop_table :cart_items
  end
end
