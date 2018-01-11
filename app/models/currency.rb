class Currency < ApplicationRecord
#	has_many :inventories
	before_destroy :check_links
	has_many :ratecurries, inverse_of: :currency, dependent: :destroy
	has_many :cashes

	 private

	def check_links
		 if ratecurries.any?
		 	 errors[:base] << "cannot delete liked record "
		 	return false
		 else
		 	 errors[:base] << "DELETED record "
		 	return true
		 end

	#	r = Ratecurry.all.where("currency_id = ?", :id)
	#	if r.nil?
	#		return false
	#    end	
	end
end
