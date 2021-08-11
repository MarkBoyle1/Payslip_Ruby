class UserInput

    def initialize
        @first_name = ''
        @surname = ''
        @annual_salary = ''
        @super_rate = ''
        @payment_start_date = ''
        @payment_end_date = ''
    end

    def get_user_input
        puts "Welcome to the payslip generator!"
        
        puts "Please input your first name: "
        @first_name = gets 
        puts "Please input your surname: "
        @surname = gets 
        puts "Please input your annual salary:"
        @annual_salary = gets.to_i 
        puts "Please input your super rate:"
        @super_rate = gets.to_f 
        puts "Please input your payment start date:"
        @payment_start_date = gets
        puts "Please input your payment end date:"
        @payment_end_date = gets
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

    def get_annual_salary
        return @annual_salary
    end
end