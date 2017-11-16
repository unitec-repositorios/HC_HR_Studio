class Department < ApplicationRecord
  belongs_to :area
  has_many :positions, dependent: :destroy
end
