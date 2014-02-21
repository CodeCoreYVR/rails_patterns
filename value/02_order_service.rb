class OrderService
  include Virtus.model

  attribute :company, Company
  attribute :consumer, User
  attribute :price, Float

  def call
    charges = if consumer.preferred_customer?
      preferred_customer_charges
    else
      normal_customer_charges
    end

    total_price = price_for(charges)
  end

  protected

  def price_for(charges)
    PriceCalculator.new(charges: charges, price: price).calculate
  end

  def preferred_customer_charges
    Charges.new(
      tax_rate: company.tax_rate,
      fee: 0
    )
  end

  def normal_customer_charges
    Charges.new(
      tax_rate: company.tax_rate,
      fee: company.fee
    )
  end

end
