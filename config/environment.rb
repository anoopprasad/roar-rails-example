# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
RoarRailsExample::Application.initialize!

# Disable root element in JSON by default.
ActiveSupport.on_load(:active_record) do
  self.include_root_in_json = false
end
