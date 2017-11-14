module ApplicationHelper

   def inventory_color(type_id)
   	    colors = ["green","white", "gray","aqua"]
   	    @color =colors[ type_id - 1]
   	
   end

end
