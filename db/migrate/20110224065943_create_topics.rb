class CreateTopics < ActiveRecord::Migration
  def self.up
    create_table :topics do |t|
      t.integer :topic_category_id
      t.integer :user_id
      t.string :title
      t.text :content
      t.string :tags

      t.timestamps
    end
  end

  def self.down
    drop_table :topics
  end
end
