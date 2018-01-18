class ApplicationController < ActionController::Base

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

   def f_rate_to_date(id_rate) #(id_cur, dt)
      # id_rt = f_find_ratecurry_id(id_cur, dt) 
        rrrr = Ratecurry.all.where(id: :id_rate).first
        rate_to_date = rrrr.rate
      # rate_to_date = Ratecurry.all.where("date_rate <= ? and currency_id = ?", dt, id_cur).order(date_rate: :desc).first.rate
      if rate_to_date.nil?
        rate_to_date = 0
      end
      #  rfrst = Ratecurry.all.where("date_rate <= ? and currency_id = ?",dt, id_cur).first
      #if not rfrst.nil?
      #   rate_to_date = rfrst.rate
      #end
    return rate_to_date
   end

   def f_find_ratecurry_id(id_cur, dt)
        idrate = Ratecurry.all.where("date_rate <= ? and currency_id = ?", dt, id_cur).order(date_rate: :desc).first.id
      if idrate.nil?
        idrate = 0
      end
     return idrate
   end

end
