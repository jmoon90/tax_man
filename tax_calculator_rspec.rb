require_relative 'tax_calculator'
require_relative 'employee'
require 'csv'

describe TaxCalculator do 
  let(:tax_calculator) {TaxCalculator.new("employee.csv")}

  it "calculates tax based on annual salary" do
    expect(tax_calculator.calculate_tax).to eql(45600.0)
  end

  it "calculates the tax liability" do 
    expect(tax_calculator.calculate_liability).to eql(17600.0)
  end
end