
require 'csv'
require 'colorize'
require "tty-prompt"
require "tty-font"
require './helpers.rb'
font = TTY::Font.new(:starwars)
pastel = Pastel.new
puts pastel.red(font.write("WELCOME"))

def menu
prompt = TTY::Prompt.new
  puts
  puts '*' * 80
  puts 'WELCOME TO NAB CREDIT CARDS'.red
  puts '*' * 80
  
  choices = [
     {key: 'u' ,  name: 'Apply a new credit card', value: 1},
    {key:  'a', name: 'Check your credit card details', value: 2},
    {key: 'c',  name: 'Update your credit card details', value: 3},
    {key: 'q', name:  'Cancel your credit card', value: 4}
]

customer_input  = prompt.enum_select("Select an editor?", choices)

end

def read_customers_csv
  csv_string = File.read('customers.csv')
  # it will read the csv file
  csv = CSV.parse(csv_string, headers: true)
  #this is creating csv object that we can call .each on
  csv
 end


loop do
  customer_input = menu
  customers = read_customers_csv
  case customer_input
  when 1
    apply_credit_card(customers)
  when 2
    check_details(customers)
  when 3
    update_credit_card(customers)
  when 4
    cancel_credit_card(customers)
  else exit
  end
end

