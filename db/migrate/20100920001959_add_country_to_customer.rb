class AddCountryToCustomer < ActiveRecord::Migration
  def self.up
    add_column :customers, :country, :string, :null => false
  end

  def self.down
    remove_column :customers, :country
  end
end
