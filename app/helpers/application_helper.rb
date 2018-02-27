module ApplicationHelper

   def inventory_color(type_id)
   	    colors = ["green","white", "gray","aqua"]
   	    @color =colors[ type_id - 1]
   	
   end

   def color_by_condition(val)
   	clr = "color: navy; background-color: skyblue; font-weight: bolder; "
   	if val < 0
   		clr = "color: yellow; background-color: red; font-weight: bolder; "
   	end
   	return clr
   end
   
   def f_check_ratecurry_exists(id_cur, dt)
      first_record = nil
      if not (id_cur.nil? or  dt.nil? )
       first_record = Ratecurry.all.where("date_rate <= ? and currency_id = ?", dt, id_cur).order(date_rate: :desc).first
      end
      return  first_record
  end

end
