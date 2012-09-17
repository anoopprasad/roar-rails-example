require 'roar/representer/json'
require 'roar/representer/feature/hypermedia'

module CompaniesRepresenter
  include Roar::Representer::JSON
  include Roar::Representer::Feature::Hypermedia

  collection :employees, :extend => EmployeeRepresenter, :class => Employee

  def employees
    collect
  end
end
