class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      t.string :email
      t.string :username
      t.string :password
      t.string :salt
      t.integer :login_times, :null => false, :default => 0
      t.datetime :last_login_at
      t.string :last_login_ip
      t.string :current_login_ip
      t.integer :state, :null => false, :default => 0
      t.integer :coins, :null => false, :default => 0
      t.integer :money, :null => false, :default => 0

      t.timestamps
    end
  end

  def self.down
    drop_table :users
  end
end
