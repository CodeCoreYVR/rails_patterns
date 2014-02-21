class PriceCalculator
  include Virtus.model

  attribute :charges, Charges
  attribute :price, Float

  def calculate
:W
    price * charges.tax_rate - charges.fee
  end
end
