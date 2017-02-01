require_relative 'employee'

class Manager < Employee

  attr_accessor :employees

  def initialize(name, title, salary, boss)
    @employees = []
    super
  end

  def bonus(multiplier)
    sum = 0
    @employees.each { |employee| sum += employee.salary }
    sum * multiplier
  end
end
