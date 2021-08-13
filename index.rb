require_relative('./user_input')
require 'csv'

def payslip_generator_welcome
    puts "Welcome to the Payslip Generator!"

    puts "Do you have a CSV file to upload? (y/n)"
    has_file = gets.downcase.chomp
    process_filepath_response(has_file)

end

def process_filepath_response(has_file)
    if has_file == 'y'
        validate_csv_file
    elsif has_file == 'n'
        user = UserInput.new(false)
        user.generate_payslip
    else 
        puts "Please enter y or n:"
        has_file = gets.downcase.chomp
        process_filepath_response(has_file)
    end
end

def validate_csv_file
    puts "Please input the filepath of your CSV:"
    csv_filepath = gets.chomp
    while !File.file?(csv_filepath)
        puts "File cannot be found. Please enter a valid filepath:" 
        csv_filepath = gets.chomp
    end
    process_csv_file(csv_filepath)
end

def process_csv_file(csv_filepath)
    system 'clear'
    data = []
    CSV.foreach(csv_filepath, headers: true) do | row |
        data << row
    end

    data.each do | row |
        user = UserInput.new(row)
        user.generate_payslip
    end
end

payslip_generator_welcome

puts "Thank you for using MYOB!"