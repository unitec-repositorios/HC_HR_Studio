class Employee < ApplicationRecord
	has_attached_file :image, styles: {medium: "168x168!"}, :default_url => ":style/default_user.jpg"
	validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

	validates_numericality_of :salary, greater_than: 0
	validates_numericality_of :emergency_contact_number, greater_than: 0

	has_many :abilities_employees 
	has_many :abilities, through: :abilities_employees
	has_many :educations_employees
	has_many :educations, through: :educations_employees
	belongs_to :position

	accepts_nested_attributes_for :abilities_employees, allow_destroy: true
	accepts_nested_attributes_for :educations_employees, allow_destroy:  true

	validates_presence_of :name
	validates_presence_of :birth_date
	validates_presence_of :salary
	validates_presence_of :address
	validates_presence_of :email
	validates_presence_of :bank_account
	validates_presence_of :contract_type
	validates_presence_of :gender
	validates_presence_of :id_number
end
