class CompaniesController < ApplicationController
  include Roar::Rails::ControllerAdditions

  respond_to :json
  
  # GET /companies
  # GET /companies.json
  def index
    begin
      @companies = Company.all
      respond_with @companies
    rescue
      puts $!.inspect, $@
      # TODO: add support for other formats
      respond_to do |format|
        format.json { render json: {errors: [$!.message]}, status: (:internal_server_error) }
      end
    end
  end

  # GET /companies/1
  # GET /companies/1.json
  def show
    begin
      @company = Company.find(params[:id])
      respond_with @company
    rescue
      puts $!.inspect, $@
      # TODO: add support for other formats
      respond_to do |format|
        format.json { render json: {errors: [$!.message]}, status: (:internal_server_error) }
      end
    end
  end

  # GET /companies/new
  # GET /companies/new.json
  def new
    @company = Company.new
    respond_with @company
  end

  # GET /companies/1/edit
  def edit
    @company = Company.find(params[:id])
  end

  # POST /companies
  # POST /companies.json
  def create
    begin
      @company = Company.new(params[:company])
      consume! @company
      respond_with @company
    rescue
      puts $!.inspect, $@
      # TODO: add support for other formats
      respond_to do |format|
        format.json { render json: {errors: [$!.message]}, status: (:internal_server_error) }
      end
    end
  end

  # PUT /companies/1
  # PUT /companies/1.json
  def update
    begin
      @company = Company.find(params[:id])
      consume! @company
      respond_with @company
    rescue
      puts $!.inspect, $@
      # TODO: add support for other formats
      respond_to do |format|
        format.json { render json: {errors: [$!.message]}, status: (:internal_server_error) }
      end
    end
  end

  # DELETE /companies/1
  # DELETE /companies/1.json
  def destroy
    begin
      @company = Company.find(params[:id])
      @company.destroy
      respond_to do |format|
        format.json { head :no_content }
      end
    rescue
      puts $!.inspect, $@
      # TODO: add support for other formats
      respond_to do |format|
        format.json { render json: {errors: [$!.message]}, status: (:internal_server_error) }
      end
    end
  end
end
