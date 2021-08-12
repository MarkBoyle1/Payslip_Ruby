require_relative('./tax')
require_relative('./user_input')
require_relative('./payslip')
require 'csv'

puts "Welcome to the Payslip Generator!"

puts "Do you have a CSV file to upload? (y/n)"
has_file = gets.downcase.chomp

if has_file == 'y'
    puts "Please input the filepath of your CSV:"
    csv_filepath = gets.chomp
    data = []
    CSV.foreach('./csv1.csv', headers: true) do | row |
        data << row
    end

    data.each do | index |
        user = UserInput.new(index)
        user.generate_payslip
    end
elsif has_file == 'n'
    user1 = UserInput.new(false)
    user1.generate_payslip
else 
    puts "Please enter y or n:"
    has_file = gets.downcase.chomp
end
