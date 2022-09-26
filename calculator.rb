puts "Enter numbers, to stop enter just an empty string"
numbers = []
user_input = nil
while user_input != "" do
    user_input = gets.encode("UTF-8").chomp
    numbers << user_input.to_i
end
numbers.delete(numbers.last)

operations = ['+', '-', '*', '/']
puts "Enter operation  #{operations}"
operation = gets.encode("UTF-8").chomp

result = numbers[0]
if operations.include? operation
    case operation
    when '+'
        numbers[1,numbers.size - 1].each { |value|
            result = result + value
        }
    when '-'
        numbers[1,numbers.size - 1].each { |value|
          result -= value
        }
    when '/'
      begin
      numbers[1,numbers.size - 1].each { |value|
            result /= value
        }
      rescue => e
        puts "An exception occurred because of " + e.message
        exit
      end
    when '*'
      numbers[1,numbers.size - 1].each { |value|
              result *= value
        }
    end
    puts result
end