def warningDoneGuess(guess)
    puts "You've already done this guess #{guess}"
end

def warningLetterNotFound
    puts "Letter not found."
end

def warningLetterFound(totalFound)
    puts "Letter found #{totalFound} times."
end

def warningRightWord
        puts "\nCongratulations, you've guessed it right!"
        puts

        puts "       ___________      "
        puts "      '._==_==_=_.'     "
        puts "      .-\\:      /-.    "
        puts "     | (|:.     |) |    "
        puts "      '-|:.     |-'     "
        puts "        \\::.    /      "
        puts "         '::. .'        "
        puts "           ) (          "
        puts "         _.' '._        "
        puts "        '-------'       "
        puts
end

def warningWrongWord
    puts "What a shame, you've guessed it wrong."
end

def warningChoosingWord
    puts "Choosing a secret word"
end

def warningChosenWord (secretWord)
    puts "Secret word with #{secretWord.size} letters chosen."
    secretWord
end

def warningScore(score)
    puts "You won #{score} points so far."
end

def warningTotalScore(totalScore)
    puts "You have #{totalScore} points."
end

def warningCurrentWinner(data)
    puts "The current winner is #{data[0]} with #{data[1]} score points."
end

def welcome
    puts "/****************/"
    puts "/ Hangman Game */"
    puts "/****************/"
    puts "What is your name?"
    name = gets.strip
    puts "\n\n\n\n\n\n"
    puts "The game will begin, #{name}"
    name
end

def playAgain?
    puts "Do you wish to play again? (Y/N)"
    wannaPlay = gets.strip
    dontWannaPlay = wannaPlay.upcase == "N"
end
def guessHeader(guesses, errors, mask)
    puts "\n\n\n\n"
    drawHang errors
    puts "Secret word: #{mask}"
    puts "Errors so far: #{errors}"
    puts "Guesses so far #{guesses}"
end

def askGuess(guesses, errors, mask)
    puts "\n\n\n\n"
    puts "Secret word: #{mask}"
    puts "Errors so far: #{errors}"
    puts "Guesses so far #{guesses}"
    puts "Type a letter or a word."
    guess = gets.strip.downcase
    puts "Do you think you've got it right? You guessed #{guess}"
    guess
end

def drawHang(errors)
    head = "   "
    body = " "
    legs = "   "
    arms = "   "
    if errors >= 1
        head = "(_)"
    end
    if errors >= 2
        arms = " | "
        body = "|"
    end
    if errors >= 3
        arms = "\\|/"
    end
    if errors >= 4
        legs = "/ \\"
    end

    puts "  _______       "
    puts " |/      |      "
    puts " |      #{head}  "
    puts " |      #{arms}  "
    puts " |       #{body}  "
    puts " |      #{legs}  "
    puts " |              "
    puts "_|___           "
    puts
end
