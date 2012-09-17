require 'roar/representer/json'
require 'roar/representer/feature/hypermedia'

module EmployeeRepresenter
  include Roar::Representer::JSON
  include Roar::Representer::Feature::Hypermedia
  
  property :name
  property :id
  #property :company

  
  link :self do
    employee_url(self.id)
  end 
end
