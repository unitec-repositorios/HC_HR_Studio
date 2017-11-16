module Admin
  class AbilitiesController < Admin::ApplicationController
    def index
      @abilities = Ability.all.order(:ability_name)
    end
  
    def new
      @ability = Ability.new
      @url = admin_abilities_path 
    end
  
    def edit
      @ability = Ability.find(params[:id])
      @url = admin_ability_path(@ability)
    end
  
    def create
      @ability = Ability.new(ability_params)
  
      if @ability.save
        redirect_to admin_abilities_path
      else
        render 'new'
      end
    end
  
    def update
      @ability = Ability.find(params[:id])
  
      if @ability.update(ability_params)
        redirect_to admin_abilities_path
      else
        render 'edit'
      end
    end
  
    def destroy
      @ability = Ability.find(params[:id])
      @ability.destroy
  
      redirect_to admin_abilities_path
    end
  
    private
      def ability_params
        params.require(:ability).permit(:ability_name)
      end
  end
end
