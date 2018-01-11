class Category < ApplicationRecord
	has_many :modelprices , dependent: :restrict_with_error 
	has_many :descriptions, dependent: :restrict_with_error 
end
