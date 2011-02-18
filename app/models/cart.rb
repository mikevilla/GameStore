class Cart

  # Reader allows attributes to be read but not written outside of the cart class.
  # Having these attributes allow for keeping track of the items and the total price
  # without always having to calculate the total price of the cart every time someone loads
  # the page and looks at their cart. You'll only need to change when you add or remove items.
  attr_reader :items
  attr_reader :total_price

  def initialize
    empty_all_items
  end

  def empty_all_items
    @items = []         # Array that holds the line items.
    @total_price = 0.0
  end
 
  def add_game ( game_item )

  # Check to see if the the item to be added already exists in the list.
  # Note that this is not a Rails find but a Ruby find to search an array for the same game_item
  existing_item = @items.find {|item| item.game_id == game_item.id}  

  # Check to see if we have the same item in the cart and if so then just add to the qty.
  if existing_item
    existing_item.quantity += 1
  else
    @items << LineItem.new_based_on( game_item ) # call the class method for LineItem
  end

  # Add the new game to total price of the shopping cart.
  @total_price += game_item.price
    
  end


  def remove_game ( game_item )

    # Check to see if there is more than one of the same item in the list
    remove_item = @items.find {|item| item.game_id == game_item.id}

    # If the item to be removed exists and te qty is greater than 1 then decrement.
    if remove_item && remove_item.quantity > 1
      remove_item.quantity -= 1
    else
      @items.delete(remove_item)
    end
    
    # Add the new game to total price of the shopping cart.
    @total_price -= game_item.price
  end
end
