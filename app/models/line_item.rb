class LineItem < ActiveRecord::Base

  belongs_to :game
  belongs_to :order

  # we are using "self" here because we dont yet have an instance of a line_item it hasn't been made yet
  # using self lets rails know that we are calling the "class method" not the instance method AND we dont have
  # an instance yet
  def self.new_based_on( game_item )
    line_item = self.new

    # Check this later
    line_item.game = game_item
    line_item.quantity = 1
    line_item.price = game_item.price

    # We want to return the object line_item
    return line_item
  end


end
