class Brand < ApplicationRecord
	has_many :inventories, dependent: :restrict_with_error 
	has_many :equipmentmodels, dependent: :restrict_with_error 
end