require 'pry'
require_relative 'liability'

class TaxCalculator
  attr_reader :first_name, :last_name, :tax_paid, :tax_rate, :annual_income, :employee, :tax_owed, :tax_due
  def initialize(file)
    @employee = Employee.load_data(file)
    @tax_owed = 0
    @tax_due = 0
  end

  def employee_final_info
    @employee.each do |employee|
      @tax_rate = (employee.tax_rate.to_f / 100) 
      @annual_income = employee.annual_income.to_f
      @tax_paid = employee.tax_paid.to_f
      @tax_owed = employee.tax_owed #+ @liability.tax_owed
      @tax_due = employee.tax_due #+ @liability.tax_due
      calculate_liability
      owed = @liability.tax_owed
      due = @liability.tax_due
      employee.instance_eval{ 
        @tax_owed += owed
        @tax_due += due
      }
    end
  end

  def calculate_tax
     @annual_income * @tax_rate
  end

  def calculate_liability
    total_tax = calculate_tax
    @liability = Liability.new(total_tax, @tax_paid, @tax_owed, @tax_due)
    @liability.amt_due_or_owed
  end

  def output
    employee_final_info
  end
end