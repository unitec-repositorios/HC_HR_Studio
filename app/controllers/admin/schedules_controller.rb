module Admin
    class SchedulesController < ApplicationController
        respond_to :json, :html, :xls
        before_action only: [:show, :edit, :update, :destroy, :index]

        def index
            @schedules = Schedule.all
            #@employees = Employee.all
            @employees = Employee.select(:name).where(:employee_id_number => :employees_id)
            #@employees = Employee.select(:name).where(:employee_id_number => 21)
            puts :employees_id.inspect
        end

        def new
            @schedule = Schedule.new
            @url = admin_schedules_path
            @employees = Employee.all
        end

        def edit
            @url = admin_schedules_path(@schedule)
        end

        def create
            @schedule = Schedule.new(schedule_params)
            @employees = Employee.select(:name).where(:employee_id_number => :employees_id)
            #@employee = Employee.where(:employee_id_number => :employees_id)
            #@employees = Employee.select(:name).where(:employee_id_number => 21)
            if @schedule.save
                redirect_to admin_schedules_path
              else
                render :new
              end
        end

        def show
            @schedule = Schedule.all
            @employees = Employee.select(:name).where("employee_id_number = ?",21)
        end

        def import
            @url = admin_schedules_import_path
            Schedule.import(params[:file])
            redirect_to admin_schedules_path, notice: "Datos Importados"
        end

        private 

        def schedule_params
            params.require(:schedule).permit(:fecha,:hora_entrada, :hora_salida,:employees_id, employees_attributes: [:name, :employee_id_number]) #falta department????
        end
    
    end
end

