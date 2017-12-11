class CallsInstructor < ApplicationRecord
	belongs_to :instructor
	belongs_to :call
end
