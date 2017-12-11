class Ability < ApplicationRecord
	has_many :abilities_employees
	has_many :employees, through: :abilities_employees

	has_many :abilities_positions
	has_many :positions, through: :abilities_positions

	has_many :calls, dependent: :destroy
end
