module Admin
	class ConfigurationscreensController < Admin::ApplicationController
		def index
      		@configuration_all = Configurationscreen.limit(1).first
    	end

		def new
			@configuration = Configurationscreen.new
			@url = admin_configurationscreens_path
		end

		def create
			@configuration_all = Configurationscreen.limit(1).first
			@configuration = Configurationscreen.new(configuration_params)
			if @configuration_all.blank?
				if @configuration.save
			    	redirect_to admin_root_path
			    else
		        	render :new
		    	end
		    else
		    	@configuration_edit = Configurationscreen.find(@configuration_all.id)
		    	if @configuration_edit.update_attributes(configuration_params)
			        redirect_to admin_root_path
			    else
			        render :new
			    end
		    end
		end

		protected

    	def configuration_params
      		params.require(:configurationscreen).permit(:image, :mission, :vision)
    	end
	end
end