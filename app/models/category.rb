class Category < ApplicationRecord
	has_many :modelprices 
	has_many :descriptions
end
