class Employee
  attr_accessor :name, :title, :salary, :boss, :employees

  def initialize(name, title, salary, boss = nil)
    @name = name 
    @title = title 
    @salary = salary 
    @boss = boss 
  end

  def bonus(multiplier)
    @salary * multiplier
  end
end

class Manager < Employee 

  def initialize(name, title, salary, boss = nil)
    super(name, title, salary, boss)
    @employees = []
  end

  def bonus(multiplier)
    self.subs_salary * multiplier
  end

  def subs_salary
    #iterates through subsequent branches
    sum = 0
    @employees.each do |employee|
      if employee.class == Manager
        sum += employee.salary + employee.subs_salary 
      else
        sum += employee.salary
      end
    end
    sum
  end
end

anthony = Manager.new("Anthony", "CEO", 500000)
chris = Manager.new("Chris", "Director of Art", 200000, anthony)
brendon = Employee.new("Brendon", "Digital Artist", 80000, chris)
joshua = Employee.new("Joshua", "Software Engineer", 100000, anthony)
anthony.employees << chris 
anthony.employees << joshua 
chris.employees << brendon

puts anthony.bonus(5)
puts chris.bonus(12)
puts brendon.bonus(2)
puts joshua.bonus(2)
