class RemoveIdFromGamesPlatforms < ActiveRecord::Migration
  def self.up
    remove_column :games_platforms, :id
  end

  def self.down
    add_column :games_platforms, :id, :integer
  end
end
