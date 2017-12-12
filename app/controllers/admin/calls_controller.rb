module Admin
	class CallsController < Admin::ApplicationController
		def index
			@calls = Call.all
		end

		def new
			@call = Call.new
			@abilities = Ability.all
			@instructors = Instructor.all
			@employees = Employee.all
			@url = admin_calls_path
		end

		def create
			@call = Call.new(call_params)
			if @call.save
		    	redirect_to admin_calls_path
		    else
		        render :new
		   	end
		end

		def edit
			@call = Call.find(params[:id])
			@abilities = Ability.all
			@instructors = Instructor.all
			@employees = Employee.all
			@url = admin_call_path(@call)
		end

	    def update
      		@call = Call.find(params[:id])

      		if @call.update_attributes(call_params)
        		redirect_to admin_calls_path
      		else
        		render :edit
      		end
    	end

	    def destroy
			@call = Call.find(params[:id])
			@call.destroy
			redirect_to admin_calls_path
	    end

	    def attendance
	    	@calls = Call.all
	    end	

	    def showlist
	    	@calls = Call.all
	    	@call_id = params[:call_id]
	    	participants_ids_query = "select employee_id, attended from calls_employees where call_id = ?;"
	    	@participants_ids = CallsEmployee.find_by_sql([participants_ids_query, @call_id])
        	render :attendance
	    end

	    def attended
	    	@calls = Call.all
	    	CallsEmployee.where({employee_id: params[:employee_ids]}).update_all({attended: true})
	    	calls_employees_query = "select employee_id, call_id, attended from calls_employees;"
	    	@calls_employees = CallsEmployee.find_by_sql([calls_employees_query])
	    	@calls_employees.each do |cemp|
	    		@ability_id = Call.select('ability_id').find(cemp.call_id)
	    		instructor_id_query = "select min(instructor_id) as ins_id from calls_instructors where call_id = ? group by call_id;"
	    		@calls_instructors = CallsInstructor.find_by_sql([instructor_id_query, cemp.call_id])
	    		@calls_instructors.each do |cins|
	    			@school_id = Instructor.select('school_id').find(cins.ins_id)
	    		end
	    		if cemp.attended == true
	    			@ability_employee = AbilitiesEmployee.new(ability_id: @ability_id.ability_id, employee_id: cemp.employee_id, school_id: @school_id.school_id)
	    			@ability_employee.save
	    		end
	    	end
	    	render :attendance
	    end

		protected

	    def call_params
	    	params.require(:call).permit!
	    end	
	end
end
