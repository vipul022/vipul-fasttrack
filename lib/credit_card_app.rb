# frozen_string_literal: true

# require_relative "vipuls_fast_track/version"
require 'csv'
require 'colorize'

def menu
  puts
  puts '*' * 40
  puts 'WELCOME TO NAB CREDIT CARDS'.red
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
  exist_customer = false
  customers = read_customers_csv
  puts 'please enter your NAB ID'.red
  customer_input = gets.chomp
  customers.each do |customer|
    customer = customer.to_hash
    next unless customer_input == customer['nab_id']

    puts "customer name: #{customer['customer_name']}".green
    puts "monthly income: $ #{customer['monthly_income']}".green
    puts "monthly expenses: $ #{customer['monthly_expenses']}".green
    exist_customer = true
  end

  puts 'Invalid NAB ID'.yellow unless exist_customer
end

def new_customer
  puts 'what is your full name?'.light_blue
  name = gets.chomp
  puts 'whats is your monthly income?'.light_blue
  income = gets.chomp.to_i
  puts 'what are your monthly expenses?'.light_blue
  expenses = gets.chomp.to_i
  new_clint = [name, income, expenses]
  monthly_surplus = income - expenses
  if monthly_surplus > 2000
    puts
    puts 'Congratulations your application has been approved'.green
    puts '-' * 40
  else
    puts
    puts 'SORRY!!!! your application has been declined'.yellow
    puts '-' * 40
  end
  CSV.open('customers.csv', 'a') do |csv|
    csv << new_clint
  end
end

def find_customer(customers, id_input)
  customers.each do |customer|
    customer_hash = customer.to_hash
    return customer_hash if id_input == customer['nab_id']
  end
end

def apply_credit_card
  customers = read_customers_csv
  puts '-' * 40
  puts 'Are you a current NAB customer?(reply yes/no)'.red
  customer_input = gets.chomp
  if customer_input == 'yes'
    puts 'please enter your NAB ID'.red
    id_input = gets.chomp
    customer = find_customer(customers, id_input)
    monthly_surplus = customer['monthly_income'].to_i - customer['monthly_expenses'].to_i
    if (id_input == (customer['nab_id'])) && (monthly_surplus > 2000)
      puts
      puts "Your monthly surplus is $ #{monthly_surplus}.".green
      puts
      puts 'Congratulations your application has been approved.'.green
    else
      puts
      puts 'SORRY!!!! your application has been declined'.yellow
      puts
    end
  elsif customer_input == 'no'
    new_customer

  end
end

def update_credit_card
  customers = read_customers_csv
  puts 'Do you want to update your monthly income? (reply yes/no)'.light_blue
  puts '-' * 40
  customer_input = gets.chomp
  if customer_input == 'yes'
    puts 'Please enter your NAB ID'.light_blue
    id_input = gets.chomp
    puts 'Please enter your updated monthly income'.light_blue
    new_income = gets.chomp
    customers.each do |customer|
      customer['monthly_income'] = new_income if customer['nab_id'] == id_input
    end
    puts
    puts 'Your monthly income has been successfully updated'.green
    CSV.open('customers.csv', 'w') do |csv|
      csv << %w[nab_id customer_name monthly_income monthly_expenses]
      customers.each do |customer|
        csv << customer.to_h.values
      end
    end
  else
    exit
  end
end

def cancel_credit_card
  customers = read_customers_csv
  puts 'Do you want to cancel your credit card? (reply yes/no)'.light_blue
  customer_input = gets.chomp
  if customer_input == 'yes'
    puts ' Please enter your NAB id'.light_blue
    id_input = gets.chomp
    customers.each do |customer|
      next unless customer['nab_id'] == id_input

      puts
      puts 'Your credit card has been cancelled'.yellow
      puts
    end
  else
    exit
  end
end

loop do
  customer_input = menu
  case customer_input
  when 1
    apply_credit_card
  when 2
    check_details
  when 3
    update_credit_card
  when 4
    cancel_credit_card
  else exit
  end
end
