class StartpageController < ActionController::Base

  before_filter :authenticate

  def index
  end
  
  def show
  end

  def authenticate
      @login_user = false
      authenticate_or_request_with_http_basic do |username, password|
         @login_user = (username == "userx" && password == "xxx" )
      end

      if  @login_user 
           @user_name = "userx"
      end
      @login_user
  end

end 

