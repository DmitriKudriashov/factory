class Product < ApplicationRecord
	has_many :modelset, dependent: :restrict_with_error 
end
