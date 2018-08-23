module Admin
	class ReportsController < Admin::ApplicationController

		def new
			@employees = Employee.all
		end

	    def create
	    	@employees = Employee.all
	    	@positions = Position.all
	    	@employee_id = params[:employee]
	    	@employee = Employee.where(:id => @employee_id)[0]
	    	@position_id = Employee.where(:id => @employee_id).pluck(:position_id)
	    	@position = Position.find(@position_id)[0]
	    	ab_intersect_query = "select ability_id from abilities_employees where employee_id = ? intersect select ability_id from abilities_positions where position_id = ?;"
	    	ab_not_from_position_query = "select ability_id from abilities_employees where employee_id = ? except select ability_id from abilities_positions where position_id = ?;"
	    	ab_notin_query = "select ability_id from abilities_positions where position_id = ? except select ability_id from abilities_employees where employee_id = ?;"
	    	@abilities_possessed = AbilitiesEmployee.find_by_sql([ab_intersect_query, @employee_id, @position_id])
	    	@abilities_not_position = AbilitiesEmployee.find_by_sql([ab_not_from_position_query, @employee_id, @position_id])
	    	@abilities_missing = AbilitiesPosition.find_by_sql([ab_notin_query, @position_id, @employee_id])

	    	ed_intersect_query = "select education_id, title, completed from educations_employees where employee_id = ? intersect select education_id, title, completed from educations_positions where position_id = ?;"
	    	ed_not_from_position_query = "select education_id, title from educations_employees where employee_id = ? except select education_id, title from educations_positions where position_id = ?;" 
	    	ed_notin_query = "select education_id, title, completed from educations_positions where position_id = ? except select education_id, title, completed from educations_employees where employee_id = ?;"
	    	title_compare_query = "select title from educations_employees where employee_id = ? intersect select title from educations_positions where position_id = ?;"
	    	@educations_possessed = EducationsEmployee.find_by_sql([ed_intersect_query, @employee_id, @position_id])
	    	@educations_not_position = EducationsEmployee.find_by_sql([ed_not_from_position_query, @employee_id, @position_id])
	    	@educations_missing = EducationsPosition.find_by_sql([ed_notin_query, @position_id, @employee_id])
	    	@title_compare = EducationsEmployee.find_by_sql([title_compare_query, @employee_id, @position_id])
	    	render :new
	    end

	end
end