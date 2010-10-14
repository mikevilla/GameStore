class CreateOrders < ActiveRecord::Migration
  def self.up
    create_table :orders do |t|
      t.primary_key :id
      t.timestamp :created_at
      t.timestamp :updated_at
      t.string :invoice_number
      t.integer :customer_id

      t.timestamps
    end
  end

  def self.down
    drop_table :orders
  end
end
