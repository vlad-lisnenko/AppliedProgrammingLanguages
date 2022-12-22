# @abstract
class Strategy
  def execute(a, b)
    raise NotImplementedError, "#{self.class} has not implemented method '#{__method__}'"
  end
end

class ConcreteStrategyAdd < Strategy
  def execute(a, b)
    a + b
  end
end

class ConcreteStrategyMultiple < Strategy
  def execute(a, b)
    a * b
  end
end

class Context

  def initialize(strategy)
    @strategy = strategy
  end

  def set_strategy=(strategy)
    @strategy = strategy
  end

  def execute_strategy(a, b)
    @strategy.execute(a, b)
  end
end

context = Context.new(ConcreteStrategyAdd.new)
puts context.execute_strategy(5, 10)

context.set_strategy = ConcreteStrategyMultiple.new
puts context.execute_strategy(5, 10)


class MyClass
  def say_some
    puts "Скоро буде запущено блок коду"
    yield
    puts "А ця фраза вже з методу, піля блок коду "
  end
end

MyClass.new.say_some {puts "тут показано як визивається блок коду"}