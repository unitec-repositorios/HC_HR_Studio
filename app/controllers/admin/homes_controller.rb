module Admin
	 class HomesController < Admin::ApplicationController
		def new
			@home = Home.all
		    @url = admin_homes_path

		    if @home.blank?
		        @configuration = Home.new
		    else
		        redirect_to edit_admin_home_path(1)
		    end
		end

		def create
			@home = Home.new(home_params)
			
			if @home.save
				redirect_to admin_root_path
			else
				flash[:errors] = 'No se pudo crear pantalla de configuracion'
				render :new
			end
		end

		def edit
			@home = Home.find(params[:id])
			@url = admin_home_path(@home)
		end

		def update
			@home = Home.find(params[:id])
			
			if @home.update_attributes(home_screen_params)
				redirect_to admin_root_path
			else
				render :edit
			end
		end

		protected
			def home_params
			  params.require(:home).permit(:mision, :vision)
			end
	end
end