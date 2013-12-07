require_relative 'employee'
require 'csv'
require 'pry'

describe Employee do 
  it 'has all the attributes of each employee from data file' do
    employee = Employee.load_data('employee.csv')
    expect(employee).to eql("Johnny")
  end
end