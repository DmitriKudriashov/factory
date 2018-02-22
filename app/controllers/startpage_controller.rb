class StartpageController < ActionController::Base

  before_filter :authenticate

  def index

     @all_incoming   = calc_cash_total_usd 
     @all_investment = calc_inventory_total_usd 
  end
 
  def show
  end

  def authenticate
      @login_user   = false
      @login_stas   = false
      @login_marina = false
      @user_name = ''
      authenticate_or_request_with_http_basic do |username, password|
         @login_user   = (username == "userx" && password == "xxx" )
         @login_stas   = (username == "Stas" && password == "Stas_2018" )
         @login_marina = (username == "Marina" && password == "Marina_18" )
         if  @login_user 
           @user_name = "userx"
         elsif @login_stas
          @user_name = "Stas"
         elsif @login_marina
          @user_name = "Marina"
         end
         if @login_user ||  @login_stas || @login_marina
          true
         else
          false
         end
      end # authenticate_or_request_with_http_basic do |username, password|
  end


  def calc_cash_total_usd    
    if not Cash.count.nil?
     rv = Cash.all.sum(:sum_usd)
    else
      rv = 0
    end
  end

  def calc_inventory_total_usd
      @allinventories = Inventory.all.order(date_investment: :desc)
      @inventory_total_usd = 0
      @allinventories.each do |invent|
        if  invent.sum_usd == 0
           invent.sum_usd = f_calc_sum_usd(2, invent.date_investment, invent.sum_curry) 
        end 
           @inventory_total_usd += invent.sum_usd 
      end #  @allinventories.each do |invent|
     return @inventory_total_usd
  end
#=======================================
  def f_calc_sum_usd(id_cur, dt, scurry)
     r_usd = 0
     if not (id_cur.nil? or  dt.nil? or scurry.nil?)
       rt = Ratecurry.all.where("date_rate <= ? and currency_id = ?", dt, id_cur).order(date_rate: :desc).first.rate
       rt1 = 0
       if not(rt.nil? or rt == 0)
              rt1 = 1/rt
       end
          r_usd =  scurry*rt1
     end
     
       return r_usd
  end
#=======================================
  def f_find_ratecurry_id(id_cur, dt)
      #idrate  = Ratecurry.find_by_sql("SELECT rate  FROM 'ratecurries' where date_rate<= '"+dt.to_s+"' and currency_id = "+id_cur.to_s+" order by date_rate desc").first.id 
        idrate = Ratecurry.all.where("date_rate <= ? and currency_id = ?", dt, id_cur).order(date_rate: :desc).first.id
      if idrate.nil?
        idrate = 0
      end
     return idrate
  end

end 

