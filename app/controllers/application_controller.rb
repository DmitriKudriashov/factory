class ApplicationController < StartpageController #ActionController::Base

  protect_from_forgery with: :exception

  def index
  end

  def f_message_destroy(rv,name)
      	 mess = 'NOT DELETED! Has many linked records!'
      if rv
          mess = 'was successfully destroyed.' 
      end 
      #return 'Record No: '+id.to_s+ ' => '+mess
      return 'Record: '+name.to_s+ ' => '+mess
  end

   def f_respond_destroy(rv,nm,f__url)   
    respond_to do |format|
      format.html { redirect_to f__url, notice: f_message_destroy(rv,nm) }
      format.json { head :no_content }
    end
   end

end
