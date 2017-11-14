class Ratecurry < ApplicationRecord
	belongs_to :currency
	has_many   :modelprices
#	has_many   :inventories
end

