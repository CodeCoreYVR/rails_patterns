class OrderService
  include Virtus.model

  attribute :company, Company
  attribute :consumer, User
  attribute :price, Float

  def call
    total_price = price_calculator.calculate

    # preferred customers get the fee comped
    if consumer.preferred_customer?
      total_price + company.fee
    end
  end

  protected

  def price_calculator
    PriceCalculator.new(company: company, price: price)
  end
end
