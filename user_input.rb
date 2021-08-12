require_relative('./tax')
require_relative('./payslip')

class UserInput

    def initialize
        @first_name = ''
        @surname = ''
        @annual_salary = ''
        @super_rate = ''
        @payment_start_date = ''
        @payment_end_date = ''
    end

    def generate_payslip
        get_user_input
    
        tax = Tax.new(@annual_salary)
        income_tax = tax.calculate_income_tax
    
        name = get_name
        pay_period = get_pay_period
        super_rate = get_super_rate
        gross_income = get_gross_income
    
        payslip = Payslip.new(name, pay_period, super_rate, gross_income, income_tax)
        payslip.display_payslip
    end

    def get_user_input
        puts "Welcome to the payslip generator!"
        
        puts "Please input your first name: "
        @first_name = gets.chomp 

        puts "Please input your surname: "
        @surname = gets.chomp 
        
        puts "Please input your annual salary:"
        @annual_salary = gets.to_i
        while !@annual_salary.positive?
            puts "Please enter a valid number:"
            @annual_salary = gets.to_i
        end
        
        puts "Please input your super rate:"
        @super_rate = gets.to_f
        while !@super_rate.positive?
            puts "Please enter a valid number:"
            @super_rate = gets.to_f
        end 
        
        puts "Please input your payment start date:"
        @payment_start_date = gets.chomp
        
        puts "Please input your payment end date:"
        @payment_end_date = gets.chomp
    end

    def get_name
        return @first_name + " " + @surname
    end

    def get_pay_period
        return @payment_start_date + " - " + @payment_end_date
    end

    def get_super_rate
        return @super_rate / 100
    end

    def get_gross_income
        return @annual_salary / 12
    end
end