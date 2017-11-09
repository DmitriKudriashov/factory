class Modelprice < ApplicationRecord
	belongs_to :category
	belongs_to :modelset
	belongs_to :description
	belongs_to :currency
	belongs_to :ratecurry
	belongs_to :unit
end
  