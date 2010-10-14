class GamesController < ApplicationController
  # GET /games
  # GET /games.xml
  def index
    @games = Game.all

    # Mike MODIFICATION make sure these are defined in any other methods that require it to
    # render the "action -> index" view
    @publishers = Publisher.find(:all)
    @platforms = Platform.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @games }
    end
  end

  # GET /games/1
  # GET /games/1.xml
  def show
    @game = Game.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @game }
    end
  end

  # GET /games/new
  # GET /games/new.xml
  def new
    @game = Game.new

    @platforms = Platform.find(:all)    
    checked_params = params[:platform_list] || []

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @game }
    end
  end

  # GET /games/1/edit
  def edit

    # Mike MODIFICATION make sure these are defined in any other methods that require it to
    # render the "action -> edit" view
    @publishers = Publisher.find(:all)
    @platforms = Platform.find(:all)

    # STANDARD SCAFFOLD
    @game = Game.find(params[:id])

  end

  # POST /games
  # POST /games.xml
  def create
    @game = Game.new(params[:game])
    @platforms = Platform.find(:all)

    checked_platforms = check_platform_using(params[:platform_list])
    unchecked_missing_platforms(@platforms,checked_platforms)

    respond_to do |format|
      if @game.save
        flash[:notice] = 'Game was successfully created.'
        format.html { redirect_to(@game) }
        format.xml  { render :xml => @game, :status => :created, :location => @game }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @game.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /games/1
  # PUT /games/1.xml
  def update
    @game = Game.find(params[:id])

    checked_platforms = check_platform_using(params[:platform_list])
    unchecked_missing_platforms(@platforms,checked_platforms)

    respond_to do |format|
      if @game.update_attributes(params[:game])
        flash[:notice] = 'Game was successfully updated.'



        format.html { redirect_to(@game) }
        format.xml  { head :ok }
      else

        # Mike MODIFICATION - Update fails so this will render the edit screen again in order to try
        # the edit again. But in order to render the page edit requires a definition of @publishers
        # just like in the edit method. The following defines this.
        @publishers = Publisher.find(:all)
        

        format.html { render :action => "edit" }
        format.xml  { render :xml => @game.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /games/1
  # DELETE /games/1.xml
  def destroy
    @game = Game.find(params[:id])
    @game.destroy

    respond_to do |format|
      format.html { redirect_to(games_url) }
      format.xml  { head :ok }
    end
  end


  private  #-----------------------------------------

  def check_platform_using ( platform_id_array )

    # Mike MODIFICATION - Update is successful so this will render the edit screen again but with the
    # saved platforms. But in order to render the page edit requires a definition of @platforms
    # just like in the edit method. The following defines this.
    @platforms = Platform.find(:all)
    checked_platforms = []

    # this is to take into consideration the scenario where none of the checkboxes are checked, empty array
    # if you don't do this then the for loop will try to loop on a nil object which is a nono
    checked_params = params[:platform_list] || []


    # note that you will be looping through the platform IDs (in the platform_list) not the
    # actual platform object.
    for check_box_id in checked_params

      # find the actual platform from the check_box_id
      platform = Platform.find(check_box_id)

      # this is going to check to see if the platform exists already in the game's platform list.
      if not @game.platforms.include?(platform)
        @game.platforms << platform
      end

      # this variable will be used to keep track of the platforms that were checked.
      checked_platforms << platform
    end

    return checked_platforms
  end

  def unchecked_missing_platforms ( platforms, checked_platforms )
    # calculate platforms that are no longer checked.
    missing_platforms = @platforms - checked_platforms

    # remove the join if no longer checked.
    for platform in missing_platforms

      # if the platform is not checked then delete the join between them.
      if @game.platforms.include?(platform)
        @game.platforms.delete(platform)
      end
    end
  end


end
