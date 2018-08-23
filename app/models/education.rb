class Education < ApplicationRecord
	has_many :educations_employees
	has_many :employees, through: :educations_employees
	has_many :schools_educations
	has_many :schools, through: :schools_educations
	has_many :educations_positions
	has_many :positions, through: :educations_positions
end
