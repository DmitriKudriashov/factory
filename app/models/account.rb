class Account < ApplicationRecord
		has_many :cashes, dependent: :restrict_with_error
end
