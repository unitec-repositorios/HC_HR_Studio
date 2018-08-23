class EducationsEmployee < ApplicationRecord
  belongs_to :education
  belongs_to :employee
end
