class Unit < ApplicationRecord
	has_many :inventories ,  dependent: :restrict_with_error 
	          
	#:restrict_with_exception   #:destroy  #, message: "This Unit using Inventory !"
	has_many :modelprices, dependent: :restrict_with_error 

end


