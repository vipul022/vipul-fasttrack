# R4 - Link to git repository
https://github.com/vipul022/vipul-fasttrack

# R5 - Software Development Plan
## Statement of Purpose: 
The core purpose behind developing this application is to make the process of credit card application very simple for the customer. This application will be an add on to NAB's own banking application. It has a very user friendly interface. This will help both current and new customers to apply for credit card and they can get the result of their application just after submitting all the required details. It will be very convenient for the existing customers to check their card details within seconds. Incase a customer wants to update his information, it can be done very easily. Furthermore, a customer can also cancel his credit card any time without any hassle.


## Scope: 
This idea came to my mind because I had a very bad experience with applying a credit card with NAB. First of all NAB's application is actually very messy and and complicated. It is not very user friendly to a customer who do not use it often. It is very annoying for a customer if he has to spend a lot of time on NAB's application or website to scroll through all the options and sub menu's in the credit card option.
After getting frustrated, a customer can leave his application in the middle and move on to another bank. NAB might be providing the best of the credit card for that customer, but in this way it's the loss of both bank and the customer. I am explaining this because I have also left my application incomplete couple of times.

The application will target all those customers who do not have much time to spend on NAB's own application which is actually a multipurpose one. This application can be separately installed on customer's device. It has a very simple and easy to operate menu. Even if a customer who has not used such applications before can easily apply for credit card because the details that are asked in this application are very general. It only focuses on credit card section oh NAB. Since a big chunk of NAB'S  income comes from credit card's revenue and interest paid by customers for not clearing their dues on time, it will highly increase NAB'S revenue. 

# R6- Features of the application
The application has following 5 key features:
### Menu
### Apply credit card
### Check details
### Update details
### Cancel credit card

Following is the description of key features:
### Apply credit card
 This feature first asks the customer if he is a current NAB customer. If customer type 'yes', then its asks for customer's NAB ID. Both the customer's input are then stored in local variables(customer_input,id_input). Then if 'find_method' figures out that he is an existing customer, then it calculates the monthly surplus bt subtracting the monthly expenses from monthly income. If monthly surplus is greater than $ 2000, it displays 'Congratulations your application has been approved' else it displays 'SORRY!!!! your application has been declined'
 Incase he replies 'no', application asks for customer's full name, monthly income and monthly savings. And if monthly income is greater than $ 2000, its displays 'Congratulations your application has been approved' otherwise it displays 'SORRY!!!! your application has been declined'
## Check details
It assists the existing customers to check their account details by first asking their NAB ID. Then it applies . each method to iterate in CSV file and then convert each row into a hash to check the same NAB ID in that particular hash
And if it finds the NAB ID of the customer, its displays Customer's full name, Monthly income, Monthly expenses. And if it does not find the NAB ID provided by customer, it displays 'Invalid NAB ID'.
## Update details 
Its assists the existing customer in updating his account details(monthly income). At first its asks customer if he wants to update his account details.If customer reply 'yes' then asks to provide NAB ID. Then it asks customer to enter his new updated monthly income and the data which customer provides, it stores that in a local variable called 'new_income'. It then applies . each method to iterate in CSV file and then convert each row into a hash and update the 'monthly_income' of the customer with 'new_income'
Further it writes the complete CSV file by firstly pushing an array of headers into it, secondly it pushes the values of the customer(hash) into the CSV. After that we have a completely new CSV file with the updated monthly income.

## R7-
It's very easy to install in a user's smart phone. The instructions for tha installation are mentioned below. The user can this application for multiple purposes. There is a menu which explains very clearly about all the features. The user can apply for a new credit card by clicking option 1 and after providing his details, the result of the application will be displayed at the bottom. The user can also check his existing account details by simply clicking option 2 from the menu. And after following the prompts, the details will displayed at the bottom. This application can used to update by user in updating details as well. After entering the NAB ID, the monthly income will be updated and a confirmation message will be displayed at the bottom. In order to cancel the credit card, user need to enter the valid NAB ID, and the credit card will be cancelled easily. In terms of handling the errors, any time user enter any invalid input, a related message will be displayed.










## R9
Please click on the link below to check the implementation plan
https://trello.com/b/47bWD3FQ/credit-card-application

## R10
1. Install ruby. In class we used `rbenv` but feel free to use any ruby installation method. To verify you have ruby installed run:

```bash
ruby -v
```

2. Install the gem:

```
gem install vipuls_fast_track
```

3. Type `irb` into terminal.

```bash
irb
```

4. Run this command in irb:

```ruby
require 'vipuls_fast_track'
```

