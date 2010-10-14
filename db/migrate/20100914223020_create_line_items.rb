class CreateLineItems < ActiveRecord::Migration
  def self.up
    create_table :line_items do |t|
      t.primary_key :id
      t.integer :order_id
      t.integer :game_id
      t.integer :quantity
      t.decimal :price
      t.timestamp :created_at
      t.timestamp :updated_at

      t.timestamps
    end
  end

  def self.down
    drop_table :line_items
  end
end
