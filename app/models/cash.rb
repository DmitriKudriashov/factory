class Cash < ApplicationRecord
	@ppg = 6
#210218	belongs_to :budgetitem
#	belongs_to :ratecurry
	belongs_to :currency
	belongs_to :account
end
