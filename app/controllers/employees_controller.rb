#require 'convenient-actionpack'

#class EmployeesController < ActionController::API
class EmployeesController < ApplicationController

  # include AbstractController::Translation # Support for the l and t localization and translation methods. These delegate to I18n.translate and I18n.localize.
  # include ActionController::HttpAuthentication::Basic::ControllerMethods # (or Digest or Token): Support for basic, digest or token HTTP authentication.
  # include AbstractController::Layouts # Support for layouts when rendering.
  # include ActionController::Cookies # Support for cookies, which includes support for signed and encrypted cookies. This requires the cookie middleware.
  
  #include ActionController::MimeResponds
  #include Convenient::Controller
  
  include Roar::Rails::ControllerAdditions

  respond_to :json

  def index
    #wrap do
      # put auth inside the wrap, e.g.
      # raise "not allowed" unless can_index?
      @employees = Employee.all
      respond_with @employees
    #end
  end

  def show
    #wrap do
      # put auth inside the wrap, e.g.
      # raise "not allowed" unless can_show?
      @employee = Employee.find(params[:id])
      respond_with @employee
    #end
  end

  def new
    #wrap do
      @employee = Employee.new
      respond_with @employee
    #end
  end

  def edit
    #wrap do
      @employee = Employee.find(params[:id])
    #end
  end

  def create
    #wrap do
      @employee = consume!(Employee.new)
      @employee.save
      respond_with @employee
    #end
  end

  def update
    #wrap do
      @employee = consume!(Employee.find(params[:id]))
      @employee.save
      respond_with @employee
    #end
  end

  def destroy
    #wrap do
      @employee = Employee.find(params[:id])
      @employee.destroy
      respond_with @employee
    #end
  end

end
