if ActiveRecord::Base.connection.tables.include?('companies')
  if Company.count == 0 && Employee.count == 0
    c1 = Company.create(:name => 'example company 1')
    c2 = Company.create(:name => 'example company 2')
    if ActiveRecord::Base.connection.tables.include?('employees')
      Employee.create(:name => 'example employee 1', :company => c1)
      Employee.create(:name => 'example employee 2', :company => c1)
      Employee.create(:name => 'example employee 3', :company => c2)
      Employee.create(:name => 'example employee 4', :company => c2)
    end
  end
else
  puts "*********************************************************"
  puts "'companies' table not found! Please run: rake db:migrate"
  puts "*********************************************************"
end

