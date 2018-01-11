class Description < ApplicationRecord
	has_many 	:inventories, dependent: :restrict_with_error 
	belongs_to  :category
end