class Liability
  attr_reader :amount_owed, :amount_due, :tax_due, :tax_owed
  def initialize(tax, tax_paid, tax_owed, tax_due)
    @tax = tax
    @tax_paid = tax_paid
    @tax_owed = tax_owed
    @tax_due = tax_due
  end

  def amt_due_or_owed
    if @tax > @tax_paid 
      @tax_due += calculate_amt_due 
    else
      @tax_owed += calculate_amt_owed
    end
  end

  def calculate_amt_due
    (@tax - @tax_paid)
  end

  def calculate_amt_owed
    (@tax_paid - @tax)
  end
end