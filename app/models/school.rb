class School < ApplicationRecord
	has_many :schools_educations
	has_many :educations, through: :schools_educations
	has_many :instructors, dependent: :destroy
end
