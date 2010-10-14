class CreateGames < ActiveRecord::Migration
  def self.up
    create_table :games do |t|
      t.primary_key :id
      t.integer :publisher_id
      t.string :title
      t.string :platform
      t.string :platform_legacy
      t.string :category
      t.string :disc_condition
      t.string :availability
      t.string :esrb
      t.string :rating
      t.decimal :price
      t.datetime :release_date
      t.datetime :pre_order_date
      t.timestamp :created_at
      t.timestamp :updated_at
      t.string :image_path
      t.integer :edition_id
      t.integer :developer_id

      t.timestamps
    end
  end

  def self.down
    drop_table :games
  end
end
