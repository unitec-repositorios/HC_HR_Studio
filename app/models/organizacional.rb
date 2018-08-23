class Organizacional < ApplicationRecord
    has_many :employees
    has_many :positons
    has_many :departments
    
end
