class Modelprice < ApplicationRecord
	belongs_to :categories
	belongs_to :descriptions
	belongs_to :currencies
	belongs_to :ratecurries
end
  