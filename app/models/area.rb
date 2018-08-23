class Area < ApplicationRecord
	has_many :departments, dependent: :destroy
end
