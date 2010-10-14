class AddRemarksToGames < ActiveRecord::Migration
  def self.up
    add_column :games, :remarks, :string
  end

  def self.down
    remove_column :games, :remarks
  end
end
