module CashesHelper
  def mess_and_style(sum_curry, sum_usd, dt)
       style_color = ''  
      # @mess_not_rate = '' 
      if not (sum_curry == 0 ) and sum_usd == 0  
         style_color =  'color: yellow; background-color: red; font-weight: bolder;'  
         
       #  @mess_not_rate = ' !!! Rate UAH Not found by date: '+dt.strftime("%d.%m.%Y") 
      end 
       return style_color
  end


end
