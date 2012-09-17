class Employee < ActiveRecord::Base
  belongs_to :company
  attr_accessible :name, :company
end
