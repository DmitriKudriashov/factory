class Cash < ApplicationRecord
	belongs_to :budgetitem
	belongs_to :ratecurry
	belongs_to :currency
end
