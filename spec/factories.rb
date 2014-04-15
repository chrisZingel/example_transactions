require 'factory_girl'
FactoryGirl.define do

  factory :customer do
    first_name   Faker::Name.first_name 
    last_name    Faker::Name.last_name 
  end

  factory :transaction do
    customer
    paid       {[true, false].sample} 
    amount     Faker::Number.number(4)
    currency  {["NZ", "US"].sample} 
    refunded  {[true, false].sample} 
    state      {["successful","failed","disputed"].sample}
  end

end
