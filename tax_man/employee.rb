require 'pry'
class Employee
  attr_reader :first_name, :last_name, :annual_income, :tax_paid, :tax_rate, :employee, :tax_owed, :tax_due
  def initialize(attributes)
    @first_name = attributes['first_name'] || ('missing')
    @last_name = attributes['last_name'] || ('missing')
    @annual_income = attributes['annual_income'] || (0)
    @tax_paid = attributes['tax_paid'] || (0)
    @tax_rate = attributes['tax_rate'] || (0)
    @tax_due = attributes['tax_due'] || (0)
    @tax_owed = attributes['tax_owed'] || (0)
  end

  def self.load_data(file)
    employees = []
    CSV.foreach(file, :headers => true) do |row|
      employee = Employee.new(row.to_hash)
      employees << employee
    end
    employees
  end
end


