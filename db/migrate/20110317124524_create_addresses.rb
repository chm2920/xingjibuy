class CreateAddresses < ActiveRecord::Migration
  def self.up
    create_table :addresses do |t|
      t.integer :user_id
      t.string :username
      t.string :city
      t.string :street
      t.string :postcode
      t.string :mobile
      t.string :phone
      t.string :deliveryType
      t.string :remark

      t.timestamps
    end
  end

  def self.down
    drop_table :addresses
  end
end
