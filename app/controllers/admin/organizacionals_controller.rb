class Admin::OrganizacionalsController < ApplicationController
  def new
    @departments = Department.all
    @areas = Area.all
    @positions = Position.all
    @employees= Employee.all
  end

end
