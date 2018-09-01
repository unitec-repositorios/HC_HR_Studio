module Admin
    class SchedulesController < ApplicationController
        respond_to :json, :html, :xls
        before_action only: [:show, :edit, :update, :destroy]

        def index
            @schedules = Schedule.all
            @employees = Employee.all
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
            @employees = Employee.all
            if @schedule.save
                redirect_to admin_schedules_path
              else
                render :new
              end
        end

        def show
            @schedule = Schedule.find(params[:id])

        end

        def import
            @url = import_admin_schedule_path
            Schedule.import(params[:file])
            redirect_to admin_schedules_path, notice: "Datos Importados"
        end

        private 

        def schedule_params
            params.require(:schedule).permit(:fecha,:hora_entrada, :hora_salida, employee:[:name]) #falta department????
        end
    
    end
end

