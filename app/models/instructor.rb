class Instructor < ApplicationRecord
	belongs_to :school
	has_many :calls_instructors
	has_many :calls, through: :calls_instructors
end
