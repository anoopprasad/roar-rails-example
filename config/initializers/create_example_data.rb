if ActiveRecord::Base.connection.tables.include?('companies')
  c1 = Company.create(:name => 'example company 1')
  c2 = Company.create(:name => 'example company 2')
  if ActiveRecord::Base.connection.tables.include?('employees')
    Employee.create(:name => 'example employee 1', :company => c1)
    Employee.create(:name => 'example employee 2', :company => c1)
    Employee.create(:name => 'example employee 3', :company => c2)
    Employee.create(:name => 'example employee 4', :company => c2)
  end
else
  puts "**********************************"
  puts "Please run: rake db:migrate first!"
  puts "**********************************"
end

