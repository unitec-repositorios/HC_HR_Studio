module Admin
    class SchedulesController < ApplicationController
        respond_to :json, :html, :xls
        before_action only: [:show, :edit, :update, :destroy, :index]

        def index
            if params[:filter]
                word = params[:filter].to_s
                word = word.split('|');
                puts word[0]
                puts word[1];
                @schedules = Schedule.where('fecha BETWEEN ? AND ?',word[0],word[1])
            else
                @schedules = Schedule.all
            end
            @employees = Employee.all
        end

        def new
            @schedule = Schedule.new
            @employees = Employee.all
            @url = admin_schedules_path
            
        end

        def edit
            @url = admin_schedules_path(@schedule)
        end

        def create
            @schedule = Schedule.new(schedule_params)
            @employees = Employee.all
            if @schedule.save
                redirect_to admin_schedules_path
              else
                render :new
              end
        end

        def show
            @schedule = Schedule.all
            @employees = Employee.all
        end

        def import
            @url = admin_schedules_import_path
            Schedule.import(params[:file])
            redirect_to admin_schedules_path, notice: "Datos Importados"
        end

        private 

        def schedule_params
            params.require(:schedule).permit(:fecha,:hora_entrada, :hora_salida,:employee_id_number, employees_attributes: [:employee_id_number, :name]) #falta department????
        end
    
    end
end

