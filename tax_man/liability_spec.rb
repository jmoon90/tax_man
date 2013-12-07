require_relative 'liability'

describe Liability do 
  it "calculates amount due based tax amount from salary" do 
    expect(Liability.new(45600.0, 28000.0).calculate_amt_due).to eql(17600.0)
  end

  it "calculates amount owed based on tax amount from salary" do 
    expect(Liability.new(7200.0, 8800.0).calculate_amt_owed).to eql(1600.0)
  end

  it "determines if tax is owed or due" do
    expect(Liability.new(7200.0, 8800.0).amt_due_or_owed).to eql(1600.0)
  end
end

