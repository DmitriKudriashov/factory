class Modelset < ApplicationRecord
    has_many   :modelprices
    belongs_to :product
end
 