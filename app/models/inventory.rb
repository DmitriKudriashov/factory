class Inventory < ApplicationRecord
	belongs_to :budgetitem
	belongs_to :description
	belongs_to :brand
	belongs_to :supplier
	belongs_to :ratecurry
	belongs_to :currency
	belongs_to :unit
	belongs_to :usingtype

end
    
