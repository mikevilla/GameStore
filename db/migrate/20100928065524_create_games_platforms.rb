class CreateGamesPlatforms < ActiveRecord::Migration
  def self.up
    create_table :games_platforms do |t|
      t.integer :game_id
      t.integer :platform_id

      t.timestamps
    end
  end

  def self.down
    drop_table :games_platforms
  end
end
