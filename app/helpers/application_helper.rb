module ApplicationHelper
   def calc_rate_to_date(in_currency_id, in_date_rate)
    rates_all = Ratecurry.all.where('currency_id = ? and date_rate <= ?',in_currency_id, in_date_rate)
    date_max  = rates_all.maximum('date_rate')
    rate_out  = rates_all.where(date_rate: date_max).first.rate
    
   end
 
end
