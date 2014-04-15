Transaction.delete_all
Customer.delete_all
[{first:"Johny",name: "Flow", success: 5,  disputed: 3},
 {first:"Raj",name: "Jamnis", success: 5, fail: 3, disputed: 2},
 {first:"Andrew",name: "chung", success: 5, fail: 3},
 {first:"Mike",name: "Smith", success: 5, fail: 3},
 {first:"Johny",name: "Flow", success: 5, fail: 3}].each do |person|
   customer = Customer.create(first_name: person[:first], last_name: person[:name])
   person[:success].times do 
     customer.transactions.create(state: "success")
   end unless person[:success].nil?

   person[:fail].times do 
     customer.transactions.create(state: "fail")
   end unless person[:fail].nil?

   person[:disputed].times do 
     customer.transactions.create(state: "disputed")
   end unless person[:disputed].nil?
 end
