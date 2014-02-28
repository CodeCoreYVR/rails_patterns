# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :barter do
    title 'A new Barter'
    offerring 'Massage'
    accepting 'Love'

    name 'John Doe'
    email 'jd@whiskey.com'
  end
end
