
arr = ["stone", "paper", "scissors", "exit"]
computerChoise = arr[rand(0..2)]

puts "enter your choice 1 - stone, 2 - paper, 3 - scissors, 4 - exit"
number = gets.to_i

if !number.between?(1, 4)
    puts "error"
    exit
end
youChoise = arr[number-1]


if  computerChoise == youChoise
    puts "computerChoise :#{computerChoise}, youChoise #{youChoise}"
    puts "Draw"
elsif computerChoise == "stone" && youChoise == "scissors" || computerChoise == "scissors" && youChoise == "paper" || computerChoise == "paper" && youChoise == "stone"
    puts "computerChoise :#{computerChoise}, youChoise #{youChoise}"
    puts "You lost"
elsif youChoise == "exit"
    exit
else
    puts "computerChoise: #{computerChoise}, youChoise: #{youChoise}"
    puts "You have won"
end