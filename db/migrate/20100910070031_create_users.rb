class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      t.primary_key :id
      t.string :name
      t.string :password
      t.timestamp :created_at
      t.timestamp :updated_at

      t.timestamps
    end
  end

  def self.down
    drop_table :users
  end
end
