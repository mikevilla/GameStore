class Game < ActiveRecord::Base

  belongs_to :publisher
  has_and_belongs_to_many :platforms
  has_many :line_items

  # validating the input for a new game, this could come from the view called new.html.erb 
  validates_presence_of :title, :category,
                        :disc_condition, :availability, :esrb, :rating,
                        :price, :release_date, :pre_order_date, :publisher
  validates_length_of :title, :minimum => 3
  validates_uniqueness_of :title

end
