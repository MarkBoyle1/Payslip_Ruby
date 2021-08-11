class Payslip

    def initialize(name, pay_period, super_rate, gross_income, income_tax)
        @name = name
        @pay_period = pay_period
        @income_tax = income_tax
        @gross_income = gross_income
        @net_income = gross_income - income_tax
        @super_amount = gross_income * super_rate
    end

    def display_payslip
        system 'clear'
        puts "Your payslip has been generated!"

        puts "Name: " + @name
        puts "Pay Period: " + @pay_period
        puts "Gross Income: " + @gross_income.to_s
        puts "Income Tax: " + @income_tax.to_s
        puts "Net Income: " + @net_income.to_s
        puts "Super: " + @super_amount.to_s

        puts "Thank you for using MYOB!"
    end
end