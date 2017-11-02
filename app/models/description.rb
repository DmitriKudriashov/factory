class Description < ApplicationRecord
	has_many 	:inventories
	belongs_to  :category
end