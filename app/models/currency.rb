class Currency < ApplicationRecord
#	has_many :inventories
#   before_destroy :check_links
	has_many :ratecurries, dependent: :restrict_with_error 
	has_many :cashes, dependent: :restrict_with_error 

   private

	def check_links
		 if ratecurries.any?
		 	 errors[:base] << "cannot delete liked record "
		 	return false
		 else
		 	 errors[:base] << "DELETED record "
		 	return true
		 end
	end
end
