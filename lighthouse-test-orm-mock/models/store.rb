class Store < ActiveRecord::Base

  has_many :employees
  
  validates :name, presence: true, length: {maximum: 25}
  validates :annual_revenue, presence: true, numericality: {only_integer: true, greater_than_or_equal_to: 0}
  validates :male_employees, presence: true, numericality: {only_integer: true, greater_than_or_equal_to: 0}
  validates :female_employees, presence: true, numericality: {only_integer: true, greater_than_or_equal_to: 0}
  
  def annual_expense
    employees.inject(0) do | sum, employee |
      sum += employee.annual_salary
    end
  end
    
  def annual_profit
    annual_revenue - annual_expense
  end
end


