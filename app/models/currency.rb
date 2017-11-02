class Currency < ApplicationRecord
	has_many :ratecurries
	has_many :inventories
end
