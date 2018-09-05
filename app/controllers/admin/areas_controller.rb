module Admin  
  class AreasController < Admin::ApplicationController
    respond_to :html, :js
    def index
      @areas = Area.all
    end

    def new
      @area = Area.new
      @url = admin_areas_path   
    end

    def create
      @exist = false
      @areas = Area.all
      
      @areas.each do |area|
        if(area.area_id_number == area_params[:area_id_number])
         @exist = true
       end
      end


      @area = Area.new(area_params)

      if !@exist
        if @area.save
          redirect_to admin_areas_path
        else
          render :new
        end
      else
        flash[:alert] = "Ya existe ese codigo de area"
        respond_with :new, :admin, :area
      end

    end

    def edit
      @area = Area.find(params[:id])
      @url = admin_area_path(@area)
    end

    def update
      @area = Area.find(params[:id])

      if @area.update_attributes(area_params)
        redirect_to admin_areas_path
      else
        render :edit
      end
    end

    def destroy
      @area = Area.find(params[:id])
      @area.destroy
      redirect_to admin_areas_path
    end

    protected

    def area_params
      params.require(:area).permit(:name, :area_id_number)
    end
  end
end