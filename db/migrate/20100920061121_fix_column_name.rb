class FixColumnName < ActiveRecord::Migration
  def self.up
     rename_column :games, :platform_legacy, :item_platform
   end


  def self.down
     rename_column :games, :item_platform, :platform_legacy
  end
end
