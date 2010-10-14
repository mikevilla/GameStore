class AddStreetToCustomer < ActiveRecord::Migration
  def self.up
    add_column :customers, :street, :string, :null => false
  end

  def self.down
    remove_column :customers, :street
  end
end
