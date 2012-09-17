require 'roar/representer/json'
require 'roar/representer/feature/hypermedia'

module CompaniesRepresenter
  include Roar::Representer::JSON
  include Roar::Representer::Feature::Hypermedia

  collection :companies, :extend => CompanyRepresenter, :class => Company

  def companies
    collect
  end
end
