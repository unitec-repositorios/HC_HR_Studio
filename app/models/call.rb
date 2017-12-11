class Call < ApplicationRecord
	has_many :calls_instructors
	has_many :instructors, through: :calls_instructors

	has_many :calls_employees
	has_many :employees, through: :calls_employees

	accepts_nested_attributes_for :calls_instructors, allow_destroy: true
	accepts_nested_attributes_for :calls_employees, allow_destroy: true

	belongs_to :ability
end
