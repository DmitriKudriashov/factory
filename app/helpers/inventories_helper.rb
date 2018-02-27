module InventoriesHelper

  def set_message(price_curry, date_investment)
  	message = ''
    if not(price_curry.nil? or price_curry == 0)
 		first_rec = f_check_ratecurry_exists(2, date_investment)
        if first_rec.nil?
          message  = ' !!!  NOT found Rate UAH to date: ' + date_investment.strftime("%d.%m.%Y")  +' ! Balance will be calculate NOT correctly !'
        end 
    end
    return message
  end

  def set_style(price_curry, date_investment)
  	set_style = ''
  	if not (set_message(price_curry, date_investment) == '' )
  		set_style = 'color: yellow; background-color: red; font-weight: bolder;'
  	end
  	return set_style
  end

end
