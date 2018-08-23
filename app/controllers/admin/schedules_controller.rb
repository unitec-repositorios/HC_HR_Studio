module Admin
    class SchedulesController < ApplicationController
        respond_to :json, :html
        before_action :set_user, only: [:show, :edit, :update, :destroy]

        def index
            @schedules = Schedule.all
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
            @date = self.date
            if @schedule.save
              redirect_to admin_schedules_path
            else
              render :new
            end
        end

        def show
        end

        private 

        def schedule_params
            params.require(:schedule).permit(:date, :start_time, :end_time, employees: [:employee_id_number,:name])
        end
    
    end
end

