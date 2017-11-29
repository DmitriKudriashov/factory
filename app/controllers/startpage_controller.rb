class StartpageController < ActionController::Base

  before_filter :authenticate

  def index
  end
  
  def show
  end

  def authenticate
    if not (@user_name = "userx" )
      authenticate_or_request_with_http_basic do |username, password|
        #username == "userx" && password == "xxx"
         @user_name = "userx"
      end
    end
  end
end
