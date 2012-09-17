class HomeController < ApplicationController
  def index
    @company_id = @company_post_existing_json = @company_put_existing_json = @employee_id = @employee_post_existing_json = @employee_put_existing_json = nil
    if ActiveRecord::Base.connection.tables.include?('companies')
      @company_id = Company.last.try(:id)
      @company_post_existing_json = "{\"name\":\"example company\"}"
      @company_put_existing_json = @company_id ? "{\"id\":#{@company_id},\"name\":\"example company #{@company_id}\"}" : nil
      @employee_id = Employee.last.try(:id)
      @employee_post_existing_json = @company_id ? "{\"name\":\"example employee\",\"company_id\":#{@company_id}}" : nil
      @employee_put_existing_json = @company_id && @employee_id ? "{\"id\":#{@employee_id},\"name\":\"example employee #{@employee_id}\",\"company_id\":#{@company_id}}" : nil
    end
  end
end
