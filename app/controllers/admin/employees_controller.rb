module Admin  
  class EmployeesController < Admin::ApplicationController
    respond_to :json, :html
    before_action :set_employee, only: [:show, :edit, :update, :destroy]

    def index
        @exist = false  
        puts params[:filter]; 
        if params[:filter] == '1'
          @employees= Employee.order("created_at ASC")
         elsif params[:filter] == '2'
          @employees = Employee.where('contract_type = ?','Practicante')
         elsif params[:filter] == '3'
          @employees = Employee.where('contract_type = ?','Contrato Temporal / Definido')
         elsif params[:filter] == '4'
          @employees = Employee.where('contract_type = ?','Contrato Permanente / Indefinido')
         else
          @employees= Employee.order("created_at ASC")  
         end
    end


    def show
        @employee = Employee.find(params[:id])
        @employee_abilities = AbilitiesEmployee.select(:employee_id, :ability_id, :school_id).where("employee_id = ?", params[:id]).distinct()
        @employee_education = EducationsEmployee.where("employee_id = ?", params[:id])
        @url = admin_employee_path(@employee)
        
        respond_to do |format|
          format.html
          format.pdf {render template: 'admin/employees/report', pdf: 'Reporte'}
        end       
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
      @exist = false
      @employees = Employee.all
      
      @employees.each do |employee|
        if(employee.employee_id_number == employee_params[:employee_id_number])
         @exist = true
       end
      end

      @employee = Employee.new(employee_params)
      @employee.hired_date = Date.today
      @employee.employee_status = true
      @positions = Position.all

      if !@exist
        if @employee.save
          flash[:notice] = t('admin.employees.create.success')
          respond_with :admin, @employee #nuevo path
        else
         flash[:warning] = @employee.errors.full_messages.uniq.join(', ')
         respond_with :new, :admin, :employee
        end
      else
        flash[:alert] = "Ya existe ese codigo de empleado"
        respond_with :new, :admin, :employee
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
      
        if @employee.update_attributes(employee_params)
          redirect_to admin_employees_path
        else
          render :edit
        end
    end

    private def set_employee
      @employee = Employee.find(params[:id])
    end

    protected
    def employee_params
        params.require(:employee).permit(:image, :name, :employee_id_number, :rap_code, :id_number, :birth_date, :gender, :birth_place, :blood_type, :marital_status,
                                        :cellphone, :emergency_contact_name, :email, :emergency_contact_number, :address, :layoff_reason, :layoff_date, :employee_status,
                                        :position_id, :bank_account, :company, :salary, :contract_type, :horario, abilities_employees_attributes: [:id, :ability_id, 
                                        :employee_id, :school_id, :_destroy], educations_employees_attributes: [:id, :school_id, :education_id, :employee_id,
                                        :completed, :title, :_destroy])
    end
  end
end
