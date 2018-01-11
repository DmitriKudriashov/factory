class Supplier < ApplicationRecord
	has_many :inventories, dependent: :restrict_with_error 
end
