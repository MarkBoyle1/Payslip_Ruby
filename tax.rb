class Tax

    def initialize(annual_salary)
        @tax_bracket_b_sum = 0
        @tax_bracket_c_sum = 3572
        @tax_bracket_d_sum = 19822
        @tax_bracket_e_sum = 54232
        
        @tax_bracket_b_rate = 0.19
        @tax_bracket_c_rate = 0.325
        @tax_bracket_d_rate = 0.37
        @tax_bracket_e_rate = 0.45

        @tax_bracket_b_min = 18200
        @tax_bracket_c_min = 37000
        @tax_bracket_d_min = 87000
        @tax_bracket_e_min = 180000

        @annual_salary = annual_salary
    end

    def calculate_income_tax
        if @annual_salary > @tax_bracket_e_min
            return (@tax_bracket_e_sum + ((@annual_salary - @tax_bracket_e_min) * @tax_bracket_e_rate)) / 12
        elsif @annual_salary > @tax_bracket_d_min
            return (@tax_bracket_d_sum + ((@annual_salary - @tax_bracket_d_min) * @tax_bracket_d_rate)) / 12
        elsif @annual_salary > @tax_bracket_c_min
            return (@tax_bracket_c_sum + ((@annual_salary - @tax_bracket_c_min) * @tax_bracket_c_rate)) / 12
        elsif @annual_salary > @tax_bracket_b_min
            return (@tax_bracket_b_sum + ((@annual_salary - @tax_bracket_b_min) * @tax_bracket_b_rate)) / 12
        else 
            return 0
        end
    end
end