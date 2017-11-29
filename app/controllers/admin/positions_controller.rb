module Admin
  class PositionsController < Admin::ApplicationController
    def index
      @positions = Position.all
    end
    
    def new
      @position = Position.new
      @abilities = Ability.all
      @educations = Education.all
      @departments = Department.all
      @url = admin_positions_path   
    end

    def create
      @position = Position.new(position_params)

      if @position.save
        redirect_to admin_positions_path
      else
        render :new
      end
    end

    def edit
      @position = Position.find(params[:id])
      @departments = Department.all
      @abilities = Ability.all
      @educations = Education.all
      @url = admin_position_path(@position)
    end

    def update
      @position = Position.find(params[:id])

      if @position.update_attributes(position_params)
        redirect_to admin_positions_path
      else
        render :edit
      end
    end

    def destroy
      @position = Position.find(params[:id])
      @position.destroy
      redirect_to admin_positions_path
    end

    protected

    def position_params
      params.require(:position).permit!
    end
  end
end