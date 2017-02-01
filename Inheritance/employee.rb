class Employee

  attr_reader :name , :title, :salary, :boss

  def initialize(name = nil, title = nil, salary = nil, boss = nil)
    @name = name
    @title = title
    @salary = salary
    @boss = boss
  end

  def bonus(multiplier)
    @salary * multiplier
  end

end
