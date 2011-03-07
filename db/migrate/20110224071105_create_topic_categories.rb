class CreateTopicCategories < ActiveRecord::Migration
  def self.up
    create_table :topic_categories do |t|
      t.integer :node_id
      t.string :name
      t.string :url
      t.string :description

      t.timestamps
    end
  end

  def self.down
    drop_table :topic_categories
  end
end
