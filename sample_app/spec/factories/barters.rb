FactoryGirl.define do

  sequence:email do |n|
    "jd_#{n}@whiskey.com"
  end

  factory :barter do
    title 'A new Barter'
    offerring 'Massage'
    accepting 'Love'

    name 'John Doe'
    email { generate(:email) }
  end
end
