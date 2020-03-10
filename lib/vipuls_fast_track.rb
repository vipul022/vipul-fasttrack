require_relative "vipuls_fast_track/version"

customers = [
  {
    customer_name: "jack douglas",
    monthly_income: 5000,
    monthly_expenses: 2200},
  {
    customer_name: "james anderson",
    monthly_income: 4000,
    monthly_expenses: 1800
  }
]

puts "WELCOME TO NAB  CREDIT CARDS"
puts "*" *40
puts "Are you a current NAB customer?"
puts "Select 1. for yes"
puts "select 2. for no"

customer_input = gets.chomp 
if customer_input = 1
  puts "*" *30
  puts "Please enter your name"
  name = gets.chomp
  
  customers.each do |customer|
    if name == customer[:customer_name] &&
    puts "hello"

    end
  end
end
