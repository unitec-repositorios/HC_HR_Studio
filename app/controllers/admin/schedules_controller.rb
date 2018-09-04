module Admin
    class SchedulesController < ApplicationController
        respond_to :json, :html, :xls
        before_action only: [:show, :edit, :update, :destroy, :index]

        def index
            @schedules = Schedule.all
            @employees = Employee.select(:name).where(:employee_id_number => 21)
            @employee_id = :employees_id
            @employees = Employee.select(:name).where(:employee_id_number => @employee_id)[0]
            puts @employees.inspect
        end

        def new
            @schedule = Schedule.new
            @url = admin_schedules_path
            @employees = Employee.all
            #@workbook = Spreadsheet.open(MyFile.first.attachment.to_file)
        end

        def edit
            @url = admin_schedules_path(@schedule)
        end

        def create
            @schedule = Schedule.new(schedule_params)
            if @schedule.save
                redirect_to admin_schedules_path
              else
                render :new
              end
        end

        def show
            @schedule = Schedule.all
            @employees = Employee.select(:name).where("employee_id_number = ?",:employees_id)
        end

        def import
            @url = admin_schedules_import_path
            Schedule.import(params[:file])
            redirect_to admin_schedules_path, notice: "Datos Importados"
        end

        private 

        def schedule_params
            params.require(:schedule).permit(:fecha,:hora_entrada, :hora_salida, :employees_id, employees:[:name]) #falta department????
        end
    
    end
end

