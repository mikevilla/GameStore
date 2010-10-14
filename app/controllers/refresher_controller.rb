class RefresherController < ApplicationController

  def game_list
    # note 1: that its good practice to retrieve the ID in a find_by_sql so that if you need (Section 11.5)
    # to update the model you are able to make sure that Rails knows which row/instance you are talking about.
    # note 2: Game.find_by_sql is a class method, we dont have any instances yet.
    # note 3: this call is a test which will only retrieve games that are under $60 and have the
    # name Marfia in it
    @games = Game.find_by_sql('SELECT * FROM games
                                  WHERE price <= \'60\' AND title LIKE \'%Mafia%\'
                                  ORDER BY publisher_id ASC;')
  end


  # This will render all of the Records
  def game_list_with_conditions

    # varible to search for specific titles
    title = 'Halo'
    cost = 60

    @games = Game.find(:all,
                       :conditions => ["price <= ? AND title LIKE ?", cost,  '%' + title + '%'],
                       :order => 'release_date ASC')
    render(:action => 'render_game_list')    
  end

  # This will render all of the Records
  def render_game_list
    @games = Game.find(:all)
  end

  def list
    @games = Game.find(:all)
    render(:action => 'render_game_list')
  end





  # SHOW GAME - Finds a SPECIFIC GAME entered by the customer.
  # HAS A VIEW
  def show_game
     # declare variables that will be used for the SQL call  
     @game = Game.find(:first,
                       :order => 'title, price ASC')
   end

  # Make sure you handle the possibility that the ID does not exist.. so use "find_by_id"
  # because just find (id) will use a ActiveRecord Record not found error instead
  # of a more meaningful message.
  def show
     # Lets use the URL parameters to dynamically tell the view which ID to show
     # For Example/ http://localhost:3000/public/show/6
     @game = Game.find_by_id(params['id'])

     # you need to to use render instead of redirect_to because  
     render(:action => 'show_game')
  end


  # NEW GAME
  # Will be called when the user wants to create a new game. It will have a view and in the view
  # once it gathers all of the attributes for a game will call create to see if it can save it to
  # the database.
  def new
    @game = Game.new
    @game.title = 'Please Enter Game Title Here'   # initialized value for title
  end


  # CREATE GAME
  def create
     # the params[:game] is coming from whatever page is calling it
     # for example the params[:game] is coming from the "new" page and contains
     # the game that the user wants to create.

     # Rails will then pre-populate a new @game with these values which can be used
     # in the create method and view page. If it can make a match it will.
     @game = Game.new(params[:game])


     # save the game that you just created with the params we received from the new page
     if @game.save
        redirect_to(:action => 'render_game_list') # NOTICE this is using REDIRECT_TO and not render
     else
        # if the save was unsuccessful then we will create some flash errors here and
        # point the user back to the new page.
        # The save was not done so therefore we are going to have to explain the errors back to the user
        # and call the new view.
        render(:action => 'new')
     end
   end


   # EDIT GAME
   def edit
         # Try 'find_by_id' here to see what happens later
         @game = Game.find_by_id(params[:id])

         # now go call on edit.html.erb with the found game and then in there call update
         # once you hav all of the new values.
   end

  # UPDATE GAME
   def update
        # will be expecting the new game info to save to the existing file AND the records ID
        # so first you have to use the :id that is from the url and find the record.
        # this will come from the (edit) button when showing one game

     @game = Game.find(params[:id])     # params[:id] comes from the url string
                                        # which came from the (edit) page
                                        # which came from the show page
                                        # which calls render(:action => 'show_game')



        # then we want to update the attributes of this record using update_attributes
        # you use in the hash :album that is passed in from the edit page because the :game
        # is the one that contains a stamp of what is to be over written to the database.
        if @game.update_attributes(params[:game])   # comes from the form data
            redirect_to(:action => 'list')
        else
            render(:action => 'edit')
        end
     end


  # DELETE GAME
    def destroy
      @game = Game.find_by_id(params[:id])
      @game.destroy

      # you are just using redirect_to here because we do not have anything from the browser
      # that we need to pass onto the next view.
      redirect_to(:action => 'list')
    end
end
