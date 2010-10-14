class CreateEditions < ActiveRecord::Migration
  def self.up
    create_table :editions do |t|
      t.primary_key :id
      t.string :name
      t.timestamp :created_at
      t.timestamp :updated_at

      t.timestamps
    end
  end

  def self.down
    drop_table :editions
  end
end
