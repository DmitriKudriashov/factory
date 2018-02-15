class Ratecurry < ApplicationRecord
	belongs_to :currency
	has_many   :modelprices, dependent: :restrict_with_error 
#	has_many   :cashes, dependent: :restrict_with_error 
	
#	has_many   :inventories
end

