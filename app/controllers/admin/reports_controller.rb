module Admin
	class ReportsController < Admin::ApplicationController

		def new
			@employees = Employee.all
	    	@positions = Position.all
		end

	    def create
	    	@employees = Employee.all
	    	@positions = Position.all
	    	@employee = params[:employee]
	    	@position = params[:position]
	    	@abilities_possessed = AbilitiesEmployee.where("employee_id = ?", @employee)
	    	render :new
	    end

	end
end