class Position < ApplicationRecord
	belongs_to :department
	has_many :employees, dependent: :destroy

	has_many :abilities_positions
	has_many :abilities, through: :abilities_positions
	has_many :educations_positions
	has_many :educations, through: :educations_positions

	accepts_nested_attributes_for :abilities_positions, allow_destroy: true
	accepts_nested_attributes_for :educations_positions, allow_destroy:  true
end
