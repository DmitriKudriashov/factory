class Unit < ApplicationRecord
	has_many :invertories  #:restrict_with_error #:restrict_with_exception   #:destroy  #, message: "This Unit using Inventory !"
	has_many :modelprices

end


