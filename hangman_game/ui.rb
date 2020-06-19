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
    puts "Congratulations! You've guessed it right!"
end

def warningWrongWord
    puts "What a shame, you've guessed it wrong."
end

def warningScore(score)
    puts "You won #{score} points so far."
end

def welcome
    puts "Welcome to the hangman game."
    puts "What is your name?"
    name = gets.strip
    puts "\n\n\n\n\n\n"
    puts "The game will begin, #{name}."
    name
end

def chooseSecretWord
    puts "Choosing a secret word"
    secretWord = "developer"
    puts "Secret word with #{secretWord.size} letters chosen."
    secretWord
end

def playAgain?
    puts "Do you wish to play again? (Y/N)"
    wannaPlay = gets.strip
    dontWannaPlay = wannaPlay.upcase == "N"
end

def askGuess(guesses, errors)
    puts "\n\n\n\n"
    puts "Errors so far: #{errors}"
    puts "Guesses so far #{guesses}"
    puts "Type a letter or a word."
    guess = gets.strip
    puts "Do you think you've got it right? You guessed #{guess}"
    guess
end