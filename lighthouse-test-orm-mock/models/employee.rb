class Employee < ActiveRecord::Base

  belongs_to :store
  
  validates :first_name, presence: true
  validates :last_name, presence: true
  
  after_create :add_one_employee, if: :store
  after_destroy :remove_one_employee, if: :store
  
  after_create :annual_salary
    
  def add_one_employee
    store.female_employees += 1 if gender == "F"
    store.male_employees += 1 if gender == "M"
    store.save 
  end
  
  def remove_one_employee
    store.female_employees -= 1 if gender == "F"
    store.male_employees -= 1 if gender == "M"
    store.save
  end
  
  def annual_salary
    hourly_rate * 1950
  end
  
  def self.average_hourly_rate_for(gender=nil)
    if gender != nil
      Employee.where(gender: gender).average(:hourly_rate).round(2)
    else
      Employee.average(:hourly_rate).round(2)
    end
  end
end
