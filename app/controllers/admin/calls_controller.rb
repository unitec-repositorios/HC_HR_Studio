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

		protected

	    def call_params
	    	params.require(:call).permit!
	    end	
	end
end
