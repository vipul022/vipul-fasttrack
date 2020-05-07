require 'csv'
require 'colorize'
require "tty-prompt"


def check_details(customers)
  prompt = TTY::Prompt.new
  exist_customer = false
  id_input = prompt.ask('Please enter your NAB id'.red)
  
  customers.each do |customer|
    customer = customer.to_hash
    next unless id_input == customer['nab_id']

    puts "customer name: #{customer['customer_name']}".green
    puts "monthly income: $ #{customer['monthly_income']}".green
    puts "monthly expenses: $ #{customer['monthly_expenses']}".green
    exist_customer = true
  end

  puts 'Invalid NAB ID'.yellow unless exist_customer
end


def new_customer
    prompt = TTY::Prompt.new
  
  name = prompt.ask('what is your full name?'.red)
  
  income = prompt.ask('what is your monthly income?'.red).to_i
  
  expenses = prompt.ask('what are your monthly expenses?'.red).to_i
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


def apply_credit_card(customers)
  prompt = TTY::Prompt.new
  puts '-' * 40
  customer_input = prompt.select('Are you a current NAB customer?'.red , %w(yes no)) 
  
  if customer_input == 'yes'
      id_input = prompt.ask('please enter your NAB ID'.red)
    
      customer = find_customer(customers, id_input)
        if customer['nab_id'] == id_input
           monthly_surplus = customer['monthly_income'].to_i- customer['monthly_expenses'].to_i
            if (id_input == (customer['nab_id'])) && (monthly_surplus > 2000)
              puts
              puts "Your monthly surplus is $ #{monthly_surplus}.".green
              puts
              puts 'Congratulations your application has been approved.'.green
            else
              puts
              puts "Your monthly surplus is $ #{monthly_surplus} which is below $2000.".yellow
              puts 'SORRY!!!! your application has been declined'.yellow
              puts
            end
          else
              puts "Invalid NAB ID".yellow 
          end    
  elsif customer_input == 'no'
    new_customer

  end
end

def update_credit_card(customers)
    prompt = TTY::Prompt.new
    customer_input = prompt.select('Do you want to update your monthly income?'.red , %w(yes no))
    
  puts '-' * 40

  if customer_input == 'yes'
    
    id_input = prompt.ask('please enter your NAB ID'.red)
    
    customer =  find_customer(customers, id_input)
      if customer['nab_id'] == id_input
        new_income = prompt.ask('Please enter your updated monthly income'.red)
        customers.each do |customer|
          customer['monthly_income'] = new_income    
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
          puts "Invalid NAB ID".yellow

      end

  else
    puts "Good bye! Have a nice day".yellow
  end
end

def cancel_credit_card(customers)
  prompt = TTY::Prompt.new
 
  
  input = prompt.yes?('Do you want to cancel your credit card?'.red)
  
  
  if  input
    
    id_input = prompt.ask('Please enter your NAB id'.red)
    
      
        customer =  find_customer(customers, id_input)
       if customer['nab_id'] == id_input
          puts 'Your credit card has been cancelled'.yellow
          puts
       else
          puts "Invalid NAB ID".yellow
       end  
   
  else
    puts "Good bye! Have a nice day".yellow
  end
end