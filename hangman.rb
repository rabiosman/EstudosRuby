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
    secretWord = "Developer"
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


def play(name)
    secretWord = chooseSecretWord
    errors = 0
    guesses = []
    score = 0

    while errors < 5
        guess = askGuess guesses, errors
        guesses << guess
        guessedALetter = guess.size == 1         
        if guessedALetter
            letterSearched = guess[0]
            totalFound = secretWord.count letterSearched
        if totalFound == 0
            puts "Letter not found."
            errors += 1            
        else
            puts "Letter found #{totalFound} times."
        end
        else
            rightGuess = guess == secretWord
            if rightGuess
                puts "Congratulations! You've guessed it right!"
                score += 100
                break
            else
                puts "What a shame, you've guessed it wrong."
                score -= 30
                errors += 1
            end
        end        
    end
    puts "You won #{score} so far."
end

name = welcome


loop do 
    play name
    if playAgain?
        break
    end
end