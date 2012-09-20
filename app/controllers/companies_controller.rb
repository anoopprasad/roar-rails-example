require 'convenient-actionpack'

class CompaniesController < ActionController::API
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
      @companies = Company.all
      respond_with @companies
    end
  end

  def show
    wrap do
      # put auth inside the wrap, e.g.
      # raise "not allowed" unless can_show?
      @company = Company.find(params[:id])
      respond_with @company
    end
  end

  def new
    wrap do
      @company = Company.new
      respond_with @company
    end
  end

  def edit
    wrap do
      @company = Company.find(params[:id])
    end
  end

  def create
    if params[:id]
      update
    else
      wrap do
        # put auth inside the wrap, e.g.
        # raise "not allowed" unless can_create?
        @company = consume!(Company.new).save
        @company.save
        respond_with @company
      end
    end
  end

  def update
    if params[:id]
      wrap do
        # put auth inside the wrap, e.g.
        # raise "not allowed" unless can_update?
        puts "original: #{Company.find(params[:id]).inspect}"
        @company = consume!(Company.find(params[:id]))
        puts "     new: #{Company.find(params[:id]).inspect}"
        @company.save
        respond_with @company
      end
    end
  end

  def destroy
    wrap do
      @company = Company.find(params[:id])
      @company.destroy
      respond_with @company
    end
  end

  #def on_action_error(error)
  #  raise error # should include prior backtrace
  #end

end
