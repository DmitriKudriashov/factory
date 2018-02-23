class Unit < ApplicationRecord
	has_many :inventories , dependent: :restrict_with_error 
	has_many :modelprices , dependent: :restrict_with_error 

end


