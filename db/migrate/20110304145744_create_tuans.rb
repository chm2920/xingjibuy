class CreateTuans < ActiveRecord::Migration
  def self.up
    create_table :tuans do |t|
      t.string :title
      t.integer :price
      t.integer :i_price
      t.integer :discount
      t.integer :save_money
      t.integer :num
      t.string :image_file_name
      t.string :ad_text
      t.text :info
      t.string :company
      t.text :com_info

      t.timestamps
    end
  end

  def self.down
    drop_table :tuans
  end
end
