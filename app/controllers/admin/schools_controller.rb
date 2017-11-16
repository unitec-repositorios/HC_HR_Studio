module Admin  
  class SchoolsController < Admin::ApplicationController
    def index
      @schools = School.order(:name)
      @url = admin_schools_path 
    end

    def new
      @school = School.new
      @url = admin_schools_path      
    end

    def create
      @school = School.new(school_params)
      if @school.save
        redirect_to admin_schools_path
      else
        render :new
      end
    end

    def edit
      @school = School.find(params[:id])
      @url = admin_school_path(@school)
    end

    def update
      @school = School.find(params[:id])

      if @school.update_attributes(school_params)
        redirect_to admin_schools_path
      else
        render :edit
      end
    end

    def destroy
      @school = School.find(params[:id])
      @school.destroy
      redirect_to admin_schools_path
    end

    protected     
    def school_params
        params.require(:school).permit!
    end
  end
end