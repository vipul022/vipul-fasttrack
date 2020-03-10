# frozen_string_literal: true

# require_relative "vipuls_fast_track/version"
require 'csv'
# customers = [
#   {
#     customer_name: "jack douglas",
#     monthly_income: 5000,
#     monthly_expenses: 2200},
#   {
#     customer_name: "james anderson",
#     monthly_income: 4000,
#     monthly_expenses: 1800
#   }
# ]

def menu
  puts 'WELCOME TO NAB CREDIT CARDS'
  puts '*' * 40
  puts 'SELECT FROM THE FOLLOWING OPTIONS:'
  puts '1. Apply a new credit card'
  puts '2. Check your credit card details'
  puts '3. Update your credit card details'
  puts '4. Cancel your credit card'
  puts 'Select from options 1 to 4'
  customer_input = gets.chomp.to_i
end

def read_customers_csv
  # it will read the csv file
  csv_string = File.new('customers.csv')
  csv = CSV.parse(csv_string, headers: true)
  csv
 end

def check_details
  customers = read_customers_csv
  customers.each do |customer|
    customer = customer.to_hash
    p customer
    # "Username: #{user["username"]} "
    puts "nab id: #{customer['nab_id']}"
  end
end
# def apply_credit_card
#   puts 'Are you a current NAB customer? (reply yes/no) '

# end
# puts 'Are you a current NAB customer?'
# puts 'Select 1. for yes'
# puts 'select 2. for no'
# customer_input = gets.chomp.to_i
# if customer_input = 1
#   puts '*' * 30
#   puts 'Please enter your name'
#   name = gets.chomp

#   customers.each do |customer|
#     if name == customer[:customer_name]

#     end
#   end
# end
while
  customer_input = menu
  case customer_input
  when 1
    apply_credit_card
  when 2
    check_details
  end
end
# while true
#   user_input = menu
#   users = read_users_csv
#   case user_input
#   when 1
#   view_contacts(users)
#   when 2
#   add_contacts(users)
#   when 3
#   puts remove_contacts(users)
#   else exit
#   end
# end
