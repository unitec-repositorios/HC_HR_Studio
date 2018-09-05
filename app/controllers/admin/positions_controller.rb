module Admin
  class PositionsController < Admin::ApplicationController
    respond_to :json, :html
    
    def index
      @positions = Position.all
    end

    def show
      @position = Position.find(params[:id])
      @position_abilities = AbilitiesPosition.where("position_id = ?", params[:id])
      @position_educations = EducationsPosition.where("position_id = ?", params[:id])
      @url = admin_position_path(@position)
    end
    
    def new
      @position = Position.new
      @abilities = Ability.all
      @educations = Education.all
      @departments = Department.all
      @url = admin_positions_path   
    end

    def create
      @exist = false
      @positions = Position.all
      
      @positions.each do |position|
        if(position.position_id_number == position_params[:position_id_number])
         @exist = true
       end
      end

      @position = Position.new(position_params)

      if !@exist     
        if @position.save
          redirect_to admin_positions_path
        else
          render :new
        end
      else
        flash[:alert] = "Ya existe ese codigo de posicion"
        respond_with :new,:admin,:position
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
      params.require(:position).permit(:position_id_number, :description, :name, :department_id, abilities_positions_attributes: [:id, :ability_id, 
                                        :position_id, :_destroy], educations_positions_attributes: [:id, :education_id, :position_id,
                                        :completed, :title, :_destroy])
    end
  end
end