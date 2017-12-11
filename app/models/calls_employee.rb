class CallsEmployee < ApplicationRecord
	belongs_to :employee
	belongs_to :call
end
