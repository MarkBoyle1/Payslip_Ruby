require_relative('./tax')
require_relative('./user_input')
require_relative('./payslip')

def generate_payslip
    user1 = UserInput.new
    user1.get_user_input

    annual_salary = user1.get_annual_salary
    tax = Tax.new(annual_salary)
    income_tax = tax.calculate_income_tax

    name = user1.get_name
    pay_period = user1.get_pay_period
    super_rate = user1.get_super_rate
    gross_income = user1.get_annual_salary

    payslip = Payslip.new(name, pay_period, super_rate, gross_income, income_tax)
    payslip.display_payslip
end

generate_payslip