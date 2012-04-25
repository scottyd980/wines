class UsersController < ApplicationController
 	def show
  	user = session[:user_id]
  	
  	if user
  		@user = User.find(user)
  		respond_to do |format|
  		  format.html # index.html.erb
  		  format.json { render :json => @user }
  		end
  	else
  		redirect_to root_url, :notice => "You're not logged in!"
  	end
  	
  	
  end
  
  # new user instance
  def new
  	@user = User.new
  end
  
  # create a new user
  def create
  	@user = User.new(params[:user])
  	if @user.save
  		redirect_to root_url, :notice => "Signed up!"
  	else
  		render "new"
  	end
  end
end
