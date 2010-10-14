class AddCityToCustomer < ActiveRecord::Migration
  def self.up
    add_column :customers, :city, :string, :null => false
  end

  def self.down
    remove_column :customers, :city
  end
end
