def main()
  words = ["собака", "тумба", "стол", "флакон", "рот", "ров", "столб", "летчик", "чашка"]
  level = [9, 7, 5]
  target_word = words[rand(words.length)]
  must_guess = target_word.length
  have_attemps = level[rand(level.length)]

  mistakes_ch = ""
  correct_ch = ""
  guesed_word = Array.new(target_word.length, "_")

  puts "\n------------------------------------------------------------------------------------------"
  puts "ГРА \"Виселица\""
  puts "Угадайте слово за #{have_attemps}"
  puts "\n------------------------------------------------------------------------------------------"

  while have_attemps != 0 && must_guess != 0 do
    puts "\nСлово: #{guesed_word.join("|")}"
    puts "Осталось попыток: #{have_attemps}"
    puts "Ошибки: #{mistakes_ch}"

    print "Буква: "
    guess = gets.chomp

    if !(guess =~ /[а-яА-Я]/) || guess.length > 1
      puts "<< Вы ввели больше чем одну букву или иной символ!"
      next
    elsif correct_ch.include?(guess)
      puts "<< Вы уже отгадали эту букву!"
      next
    end

    number_matche = target_word.count(guess.downcase)
    if number_matche == 0
      puts "<< Мимо "
      have_attemps -= 1
      if !mistakes_ch.include?(guess)
        mistakes_ch << guess << " "
      end
    else
      puts "<< Верно, молодец"
      must_guess -= number_matche
      guesed_word = change_displayed_string(guesed_word, target_word, guess, number_matche)
      correct_ch << guess
    end
  end

  puts "\n----------------------------------------------------------------------------------"
  if  must_guess == 0
    puts "Вы выиграли"
  else
    puts "Вы проиграли"
  end
  puts "Загаданное слово: #{target_word}"
  puts "-----------------------------------------------------------------------------------"

end

def change_displayed_string(guesed_word, target_word, guess, number_matche)
  d = 0
  replace = 0
  while replace < number_matche do
    if target_word[d] == guess
      guesed_word[d] = guess
      replace += 1
    end
    d += 1
  end

  return guesed_word
end

main()