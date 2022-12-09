
class Facade

  def initialize(subsystem1, subsystem2)
    @subsystem1 = subsystem1
    @subsystem2 = subsystem2
  end

  def operation
    results = []
    results.append('Facade initializes subsystems:')
    results.append(@subsystem1.operation1)
    results.append(@subsystem2.operation1)
    results.append('A facade instructs subsystems to perform an action:')
    results.append(@subsystem1.operation_n)
    results.append(@subsystem2.operation_x)
    results.join("\n")
  end
end

class Subsystem1
  def operation1
    'Subsystem1: Start of operation!'
  end

  def operation_n
    'Subsystem1: Go!'
  end

  def operation_99
    'Subsystem1: End of operation!'
  end
end

class Subsystem2
  def operation1
    'Subsystem2: Starting the system 2!'
  end

  def operation_x
    'Subsystem2: Water supply and shutdown of the subsystem!'
  end
end


def client(facade)
  print facade.operation
end

subsystem1 = Subsystem1.new
subsystem2 = Subsystem2.new
facade = Facade.new(subsystem1, subsystem2)
client(facade)