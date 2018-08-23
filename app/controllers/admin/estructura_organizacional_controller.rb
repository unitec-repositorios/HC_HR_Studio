module Admin
class EstructuraOrganizacionalController < ApplicationController
    def new
        @positions = Position.all
    end

    def create
        
    end
end
end
