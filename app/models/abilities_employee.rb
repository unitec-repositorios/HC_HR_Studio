class AbilitiesEmployee < ApplicationRecord
	belongs_to :ability
	belongs_to :employee
	validates_uniqueness_of :ability_id, :scope => :employee_id
end
