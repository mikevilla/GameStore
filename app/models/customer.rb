class Customer < ActiveRecord::Base

  has_many :orders

  # validating the input for a new game, this could come from the view called new.html.erb
  validates_presence_of :first_name, :last_name,
                        :zip_code, :street, :city, :country, :phone 
  # validates_length_of :title, :minimum => 3
  # validates_uniqueness_of :test
end
