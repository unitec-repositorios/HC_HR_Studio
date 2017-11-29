module Admin  
  class EmployeesController < Admin::ApplicationController

    def index
        @employees= Employee.order("created_at ASC")
    end

    def show
        @employee = Employee.find(params[:id])
        @employee_abilities = AbilitiesEmployee.where("employee_id = ?", params[:id])
        @employee_education = EducationsEmployee.where("employee_id = ?", params[:id])
        @url = admin_employee_path(@employee)
    end

    def new
        @employee = Employee.new
        @positions = Position.all
        @abilities = Ability.all
        @educations = Education.all
        @schools = School.all
        @url = admin_employees_path   
    end

    def create
        @employee = Employee.new(employee_params)
        @employee.rap_code = @employee.id_number
        @employee.hired_date = Date.today
        @employee.employee_status = true
        @positions = Position.all

        if  @employee.save
            redirect_to admin_employees_path

        else
          render :new
        end
    end

    def edit
        @employee = Employee.find(params[:id])
        @positions = Position.all
        @abilities = Ability.all
        @educations = Education.all
        @schools = School.all
        @url = admin_employee_path(@employee)
    end

    def update
        @employee = Employee.find(params[:id])
        @employee.rap_code = @employee.id_number
    
        if @employee.update_attributes(employee_params)
          redirect_to admin_employees_path
        else
          render :edit
        end
    end

    protected
    def employee_params
        params.require(:employee).permit(:image, :name, :employee_id_number, :id_number, :birth_date, :gender, :birth_place, :blood_type, :marital_status,
                                        :cellphone, :emergency_contact_name, :email, :emergency_contact_number, :address, :layoff_reason, :layoff_date, :employee_status,
                                        :position_id, :bank_account, :company, :salary, :contract_type, abilities_employees_attributes: [:id, :ability_id, 
                                        :employee_id, :school_id, :_destroy], educations_employees_attributes: [:id, :school_id, :education_id, :employee_id,
                                        :completed, :title, :_destroy])
    end
  end
end
