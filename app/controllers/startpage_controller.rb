class StartpageController < ActionController::Base

  before_filter :authenticate

  def index
  	
  end
  def show
  	
  end
  def authenticate
    if !@user_name
      authenticate_or_request_with_http_basic do |username, password|
        username == "user" && password == "xxx"
       # @user_name = "user"
      end
    end
  end
end
