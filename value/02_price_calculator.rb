PriceCalculator = Struct.new(:company) do
  include Virtus.model

  attribute :company, Company
  attribute :price, Float

  def calculate
    price * company.tax_rate - company.fee
  end
end
