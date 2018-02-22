class Budgetitem < ApplicationRecord
	has_many :inventories, dependent: :restrict_with_error 
#210218	has_many :cashes, dependent: :restrict_with_error 
end
