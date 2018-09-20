module Admin
class Admin::OrganizacionalsController < ApplicationController 
  
  def index
  		@areas = Area.all
  		@departments = Department.all
		@positions = Position.all 
		@employees = Employee.all
  end
  
end
end


