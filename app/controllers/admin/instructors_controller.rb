module Admin
	class InstructorsController < Admin::ApplicationController
		def index
			@instructors = Instructor.all
		end

		def new
			@instructor = Instructor.new
			@schools = School.all
			@professions = Education.all
			@url = admin_instructors_path
		end

		def create
	      @instructor = Instructor.new(instructor_params)

	      if @instructor.save
	        redirect_to admin_instructors_path
	      else
	        render :new
	      end
    	end

    	def edit
	      @instructor = Instructor.find(params[:id])
	      @schools = School.all
	      @professions = Education.all
	      @url = admin_instructor_path(@instructor)
	    end

	    def update
	      @instructor = Instructor.find(params[:id])

	      if @instructor.update_attributes(instructor_params)
	        redirect_to admin_instructors_path
	      else
	        render :edit
	      end
	    end

	    def destroy
	      @instructor = Instructor.find(params[:id])
	      @instructor.destroy
	      redirect_to admin_instructors_path
	    end

    	protected

    	def instructor_params
      		params.require(:instructor).permit!
    	end
	end
end
