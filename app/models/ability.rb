class Ability < ApplicationRecord
	has_many :abilities_employees
	has_many :employees, through: :abilities_employees
end
