class EmployeesController < ApplicationController
  def index
    @employees = EmployeesDatatable.new(params)
    render json: @employees
  end
end
