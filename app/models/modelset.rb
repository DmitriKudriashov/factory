class Modelset < ApplicationRecord
    has_many   :modelprices, dependent: :restrict_with_error 
    belongs_to :product
end
 