class ApplicationController < ActionController::Base
  protect_from_forgery
  
  helper_method :current_user
  
#  def login_required
#    if session[:user]
#      return true
#    end
#    flash[:warning]='Please login to continue'
#    session[:return_to]=request.request_uri
#    redirect_to :controller => "user", :action => "login"
#    return false 
#  end
	
	private
	
  def current_user
   @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

end
