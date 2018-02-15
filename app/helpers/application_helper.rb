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
end
