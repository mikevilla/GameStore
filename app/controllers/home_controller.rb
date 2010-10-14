class HomeController < ApplicationController


  before_filter :find_or_create_cart, :except => [:index]
  layout 'standard'

  def index
    # put all of the games in an array that is sorted by name
     @games = Game.find(:all, :order => 'title ASC')
  end


  # notes: we are going to store line items in an object but not in the database until
  # the user actually checkouts. If they change there mind and close the browser we will be ok
  # because we dont add anything to the DB until checkout.
  def add_to_cart

    # Get the game id from the url and find it so that the controller can work with it
    game_item = Game.find(params[:id])
    @cart.add_game(game_item)
    
    # once you have successfully added a new game to the cart go to the "show cart" action.
    redirect_to(:action => 'show_cart')
  end

  def show_cart
    # this will find and returns the session cart
  end

  def empty_cart
    @cart.empty_all_items
    flash[:notice] = 'Your cart is now empty'
    redirect_to(:action => 'index')
  end


  def remove_from_cart
    game_item = Game.find(params[:id])
    @cart.remove_game(game_item)
    flash[:notice] = 'Item has been successfully removed.'
    redirect_to(:action => 'show_cart')
  end

  def checkout
    @customer = Customer.new
  end

  def save_order
    @customer = Customer.new(params[:customer])
    credit_card_number = params[:credit_card]

    @order = Order.new
    @order.line_items << @cart.items
    @customer.orders << @order
    if @customer.save
      #try process payment
      #if payment fails, send to a fix page
      #if payment succeeds

      redirect_to(:action =>'show_receipt', :id => @order.id)
    else
      render(:action => 'checkout')
    end

  end

  def show_receipt
    @order = Order.find(params[:id])
  end
      private #-------------------

  # This method will either find the cart or if it doesn't exist then create a new one and put
  # it in the session.
  # This allows us to find an existing cart if there are none create one.
  def find_or_create_cart

    # Return the cart that is in the sessions OR if it doesn't exist then crete a new cart and put
    # it in the session.
    # Basically find an existing cart and if there are none then create one.
    @cart = session[:cart] ||= Cart.new       # Returns the session with the cart object
  end

end
