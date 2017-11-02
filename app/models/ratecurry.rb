class Ratecurry < ApplicationRecord
	# attr_accesible :currency_id, :rate, :date_rate
	belongs_to :currency
	has_many   :modelprice
	has_many   :inventory
end

