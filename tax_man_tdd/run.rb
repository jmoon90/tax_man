require 'csv'
require 'pry'
require_relative 'employee'
require_relative 'tax_calculator'
require_relative 'liability'

file = 'employee.csv'
calculator = TaxCalculator.new(file)

calculator.output.each do |employee|
  print "#{employee.first_name} #{employee.last_name}"
  if employee.tax_due > employee.tax_owed
    puts " has a tax liability of $#{employee.tax_due.round(2)}"
  else
    puts " will receive a refund of $#{employee.tax_owed.round(2)}"
  end
end

# 
