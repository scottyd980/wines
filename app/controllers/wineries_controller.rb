class WineriesController < ApplicationController
  # GET /wineries
  # GET /wineries.json
  def index
  	@wineries = Winery.paginate(:page => params[:page], :per_page => 10)
  	
    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @wineries }
    end
  end

  # GET /wineries/1
  # GET /wineries/1.json
  def show
    @winery = Winery.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @winery }
    end
  end

  # GET /wineries/new/?id=1
  # GET /wineries/new/?id=1.json
  def new
  	user = session[:user_id]
  	
  	if user
  
    	@winery = Winery.find(params[:id])
    	@user = User.find(user)
    	
    	if @user.wineries.include?(@winery)
    		
    		redirect_to winery_path(@winery.id), :notice => "Already part of your tour!"
    		
    	else
    	
    		@user.wineries << @winery
    		redirect_to winery_path(@winery.id), :notice => "Added to your tour list!"
    	
    	end
    	
		else 
		
			redirect_to root_url, :notice => "You're not logged in!"
			
    end
  end

  # GET /wineries/1/edit
  def edit
    @winery = Winery.find(params[:id])
  end

  # POST /wineries
  # POST /wineries.json
  def create
    @winery = Winery.new(params[:winery])

    respond_to do |format|
      if @winery.save
        format.html { redirect_to @winery, :notice => 'Winery was successfully created.' }
        format.json { render :json => @winery, :status => :created, :location => @winery }
      else
        format.html { render :action => "new" }
        format.json { render :json => @winery.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /wineries/1
  # PUT /wineries/1.json
  def update
    @winery = Winery.find(params[:id])

    respond_to do |format|
      if @winery.update_attributes(params[:winery])
        format.html { redirect_to @winery, :notice => 'Winery was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @winery.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /wineries/1
  # DELETE /wineries/1.json
  def destroy
    @winery = Winery.find(params[:id])
    # @winery.destroy
    
    user = session[:user_id]
    
    if user
    	
    	@user = User.find(user)
    
    	@user.wineries.delete(@winery)
    	
    	redirect_to user_path, :notice => "Removed from tour list!"
    
    else
    
    	redirect_to root_url, :notice => "You're not logged in!"
    
    end
  end
end
