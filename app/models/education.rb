class Education < ApplicationRecord
	has_many :educations_employees
	has_many :employees, through: :educations_employees
	has_many :schools_educations
	has_many :schools, through: :schools_educations
end
