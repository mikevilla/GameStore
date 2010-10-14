class CreatePublishers < ActiveRecord::Migration
  def self.up
    create_table :publishers do |t|
      t.primary_key :id
      t.string :name
      t.integer :year_established
      t.text :about
      t.timestamp :created_at
      t.timestamp :updated_at

      t.timestamps
    end
  end

  def self.down
    drop_table :publishers
  end
end
