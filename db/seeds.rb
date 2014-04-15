Transaction.delete_all
Customer.delete_all

def default_txns
  { paid: [true, false].sample,
    amount: Faker::Number.number(4),
    currency: ["NZ", "US"].sample,
    refunded: [true, false].sample,
    state: ["successful","failed","disputed"].sample
  }
end

[{first:"Johny",   name: "Flow",    successful: 5,  disputed: 3},
 {first:"Raj",     name: "Jamnis",  successful: 3,  disputed: 2},
 {first:"Andrew",  name: "chung",   successful: 1,  failed: 3},
 {first:"Mike",    name: "Smith",   successful: 1,  failed: 2},
 {first:"Johny",   name: "Flow",    successful: 5}].each do |person|
   customer = Customer.create(first_name: person[:first], last_name: person[:name])
   [:successful,:failed,:disputed].each do |type|
     person[type].times do
       customer.transactions.create(default_txns.merge(state: type.to_s))
     end unless person[type].nil?
   end
 end
