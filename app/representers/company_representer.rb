require 'roar/representer/json'
require 'roar/representer/feature/hypermedia'

module CompanyRepresenter
  include Roar::Representer::JSON
  include Roar::Representer::Feature::Hypermedia

  property :name
  property :id
  
  collection :employees, :class => Employee
  
  # requires this in environment.rb or similar: config.representer.default_url_options = {:host => "127.0.0.1:3000"}
  link :self do
    company_url(self.id)
  end
end
