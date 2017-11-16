module Admin  
  class EducationsController < Admin::ApplicationController
    def index
        @educations = Education.all
      end

      def new
        @education = Education.new
        @url = admin_educations_path   
      end

    def create
      @education = Education.new(education_params)

      if @education.save
        redirect_to admin_educations_path
      else
        render :new
      end
    end

    def edit
      @education = Education.find(params[:id])
      @url = admin_education_path(@education)
    end

    def update
      @education = Education.find(params[:id])

      if @education.update_attributes(education_params)
        redirect_to admin_educations_path
      else
        render :edit
      end
    end

    def destroy
      @education = Education.find(params[:id])
      @education.destroy
      redirect_to admin_educations_path
    end

    protected

    def education_params
      params.require(:education).permit!
    end
  end
end