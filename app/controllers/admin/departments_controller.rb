module Admin  
  class DepartmentsController < Admin::ApplicationController
    def index
      @departments = Department.all
    end

    def new
      @department = Department.new
      @areas = Area.all
      @url = admin_departments_path   
    end

    def create
      @department = Department.new(department_params)

      if @department.save
        redirect_to admin_departments_path
      else
        render :new
      end
    end

    def edit
      @department = Department.find(params[:id])
      @areas = Area.all
      @url = admin_department_path(@department)
    end

    def update
      @department = Department.find(params[:id])

      if @department.update_attributes(department_params)
        redirect_to admin_departments_path
      else
        render :edit
      end
    end

    def destroy
      @department = Department.find(params[:id])
      @department.destroy
      redirect_to admin_departments_path
    end

    protected

    def department_params
      params.require(:department).permit!
    end
  end
end