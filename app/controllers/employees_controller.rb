require 'convenient-actionpack/controller'

class EmployeesController < ActionController::API
  # include AbstractController::Translation # Support for the l and t localization and translation methods. These delegate to I18n.translate and I18n.localize.
  # include ActionController::HttpAuthentication::Basic::ControllerMethods # (or Digest or Token): Support for basic, digest or token HTTP authentication.
  # include AbstractController::Layouts # Support for layouts when rendering.
  # include ActionController::Cookies # Support for cookies, which includes support for signed and encrypted cookies. This requires the cookie middleware.
  include ActionController::MimeResponds
  include Convenient::Controller
  include Roar::Rails::ControllerAdditions

  respond_to :json

  def index
    puts "params[:action]=#{params[:action].inspect}"
    wrap do
      # put auth inside the wrap, e.g.
      # raise "not allowed" unless can_index?
      @employees = Employee.all
      respond_with @employees
    end
  end

  def show
    wrap do
      # put auth inside the wrap, e.g.
      # raise "not allowed" unless can_show?
      @employee = Employee.find(params[:id])
      respond_with @employee
    end
  end

  def new
    wrap do
      @employee = Employee.new
      respond_with @employee
    end
  end

  def edit
    wrap do
      @employee = Employee.find(params[:id])
    end
  end

  def create
    if params[:id]
      update
    else
      wrap do
        # put auth inside the wrap, e.g.
        # raise "not allowed" unless can_create?
        @employee = Employee.new(params[:employee])
        consume! @employee
        respond_with @employee
      end
    end
  end

  def update
    if params[:id]
      wrap do
        # put auth inside the wrap, e.g.
        # raise "not allowed" unless can_update?
        @employee = Employee.find(params[:id])
        consume! @employee
        respond_with @employee
      end
    end
  end

  def destroy
    wrap do
      @employee = Employee.find(params[:id])
      @employee.destroy
      respond_with @employee
    end
  end

end
