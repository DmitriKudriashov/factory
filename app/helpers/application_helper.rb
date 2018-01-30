module ApplicationHelper

   def inventory_color(type_id)
   	    colors = ["green","white", "gray","aqua"]
   	    @color =colors[ type_id - 1]
   	
   end
   def calc_inventory_total_usd
		 @allinventories = Inventory.all.order(date_investment: :desc)
  		  @inventory_total_usd = 0
      
   		@allinventories.each do |invent|
   			if invent.sum_usd.nil? or invent.sum_usd = 0
                
   				if invent.sum_curry <=> 0
   					invent.sum_usd = 0
   					rt = f_find_ratecurry_id(2, invent.date_investment)		
   					if 	rt >0
   						invent.sum_usd = invent.sum_curry/rt
   					end
   				end

   			end

           @inventory_total_usd += invent.sum_usd 
   		end
   	    return @inventory_total_usd
   end

   def calc_cash_total_usd
   	
   	if not Cash.count.nil?
   	 rv = Cash.all.sum(:sum_usd)
   	else
   	  rv = 0
   	end
    
   end


   def f_find_ratecurry_id(id_cur, dt)
        idrate = Ratecurry.all.where("date_rate <= ? and currency_id = ?", dt, id_cur).order(date_rate: :desc).first.id
      if idrate.nil?
        idrate = 0
      end
     return idrate
   end
   
   def color_by_condition(val)
   	clr = "color: navy; background-color: skyblue; font-weight: bolder; "
   	if val < 0
   		clr = "color: yellow; background-color: red; font-weight: bolder; "
   	end
   	return clr
   end
end
