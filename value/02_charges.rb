class Charges
  include Virtus.value_object

  values do
    attribute :tax_rate, Float
    attribute :fee, Float
  end


end
