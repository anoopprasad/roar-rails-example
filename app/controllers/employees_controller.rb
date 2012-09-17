class EmployeesController < ApplicationController
  respond_to :json
  
  # GET /employees
  # GET /employees.json
  def index
    @employees = Employee.all
    respond_with @employees
  end

  # GET /employees/1
  # GET /employees/1.json
  def show
    @employee = Employee.find(params[:id])
    respond_with @employee
  end

  # GET /employees/new
  # GET /employees/new.json
  def new
    @employee = Employee.new
    respond_with @employee
  end

  # GET /employees/1/edit
  def edit
    @employee = Employee.find(params[:id])
  end

  # POST /employees
  # POST /employees.json
  def create
    @employee = Employee.new(params[:employee])
    consume! @employee
    respond_with @employee
  end

  # PUT /employees/1
  # PUT /employees/1.json
  def update
    @employee = Employee.find(params[:id])
    consume! @employee
    respond_with @employee
  end

  # DELETE /employees/1
  # DELETE /employees/1.json
  def destroy
    @employee = Employee.find(params[:id])
    @employee.destroy

    respond_to do |format|
      format.json { head :no_content }
    end
  end
end
